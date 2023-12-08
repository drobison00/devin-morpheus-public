/*
 * SPDX-FileCopyrightText: Copyright (c) 2021-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "morpheus/modules/llm_engine_module.hpp"

#include "morpheus/llm/llm_context.hpp"
#include "morpheus/messages/control.hpp"
#include "morpheus/utilities/caching_util.hpp"

#include <glog/logging.h>
#include <mrc/modules/segment_modules.hpp>
#include <mrc/segment/builder.hpp>
#include <mrc/segment/object.hpp>
#include <mrc/utils/type_utils.hpp>
#include <nlohmann/json.hpp>
#include <pybind11/pybind11.h>
#include <pymrc/utilities/object_cache.hpp>
#include <rxcpp/rx.hpp>
// IWYU pragma: no_include "rxcpp/sources/rx-iterate.hpp"

#include <functional>
#include <memory>
#include <ostream>
#include <regex>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace py = pybind11;
using json   = nlohmann::json;

namespace {
using namespace morpheus;
template <typename SinkTypeT, typename SourceTypeT, typename ContextT>
class LLMEngineNode
  : public mrc::pymrc::AsyncioRunnable<std::shared_ptr<ControlMessage>, std::shared_ptr<llm::LLMContext>>
{
  public:
    LLMEngineNode(std::shared_ptr<llm::LLMEngine> engine) : m_engine(std::move(engine)) {}

    ~LLMEngineNode() override = default;

  private:
    mrc::coroutines::AsyncGenerator<std::shared_ptr<llm::LLMContext>> on_data(
        std::shared_ptr<ControlMessage>&& data) override
    {
        // TODO(Devin): We want to implement the LLMTask/LLMContext creation here.
        // auto result = co_await m_engine->run(std::move(data));

        std::vector<std::shared_ptr<llm::LLMContext>> output_contexts;
        if (!data)
        {
            // If the message is empty, it means that the prior stage returned null or None, I don't think we
            // want this to be a hard error; just return. TODO
            // co_return;
            throw std::runtime_error("LLMEngineNode::on_data() called with a null message");
        }

        if (!data->has_task("llm_engine"))
        {
            // If we don't have an LLM engine task, just forward the message.
            throw std::runtime_error(
                "LLMEngineNode::on_data() called with a message that does not have the 'llm_engine' task");
            // TODO output_messages.push_back(data);
        }
        else
        {
            while (data->has_task("llm_engine"))
            {
                auto current_task = data->remove_task("llm_engine");

                // Temp create an instance of LLMTask for type safety
                llm::LLMTask tmp_task(current_task["task_type"].get<std::string>(), current_task.at("task_dict"));

                // Set the name, task, control_message and inputs on the context
                auto context = std::make_shared<llm::LLMContext>(tmp_task, data);

                // We want to emit the LLMContext, so it can flow through the LLMEngine. Eventually this should be
                // inverted so the LLMContext is attached to the ControlMessage...
                // This is effectively like calling execute on the child nodes.

                output_contexts.push_back(context);
            }
        }

        for (auto&& out_context : output_contexts)
        {
            co_yield std::move(out_context);
        }

        co_return;
    }

    std::shared_ptr<llm::LLMEngine> m_engine;
};

std::shared_ptr<mrc::segment::ObjectProperties> process_node(const json& child,
                                                             const std::regex& uuid_regex,
                                                             std::smatch& uuid_match,
                                                             mrc::segment::IBuilder& builder)
{
    if (!child.contains("node") || !child.contains("name"))
    {
        throw std::runtime_error("Each child must contain a 'node' and a 'name' key.");
    }

    if (!child["name"].is_string())
    {
        throw std::runtime_error("'name' must be a string.");
    }

    std::string name = child["name"];
    std::string node = child["node"];
    if (!std::regex_match(node, uuid_match, uuid_regex))
    {
        throw std::runtime_error("'node' does not match the required format 'cache_object:[UUID]'.");
    }

    std::string uuid        = uuid_match[1].str();
    auto cached_initializer = retrieve_cached_initializer(uuid);

    return cached_initializer(builder);
}

std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> process_pipeline(const json& engine_config,
                                                                              mrc::segment::IBuilder& builder)
{
    if (engine_config.contains("pipeline") && !engine_config["pipeline"].is_array())
    {
        throw std::runtime_error("Pipeline must contain a list of stages.");
    }

    std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> child_nodes;
    std::regex uuid_regex("cache_object:([0-9a-fA-F-]{36})");
    std::smatch uuid_match;

    for (auto& pipeline_node : engine_config["pipeline"])
    {
        child_nodes.push_back(process_node(pipeline_node, uuid_regex, uuid_match, builder));
    }

    return child_nodes;
}
}  // namespace

namespace morpheus {

LLMEngineModule::~LLMEngineModule() noexcept
{
    VLOG(30) << "DataLoaderModule::~DataLoaderModule(): " << name() << std::endl;
}

LLMEngineModule::LLMEngineModule(std::string module_name, nlohmann::json _config) :
  SegmentModule(std::move(module_name), std::move(_config))
{
    if (config().contains("llm_engine"))
    {
        auto engine_config = config()["llm_engine"].get<std::string>();
        std::regex uuid_regex("cache_object:([0-9a-fA-F-]{36})");
        std::smatch uuid_match;
        if (std::regex_search(engine_config, uuid_match, uuid_regex))
        {
            std::string uuid   = uuid_match[1];
            auto& cache_handle = mrc::pymrc::PythonObjectCache::get_handle();

            if (cache_handle.contains(uuid))
            {
                auto cached_object = cache_handle.pop(uuid);
                m_engine           = pybind11::cast<std::shared_ptr<llm::LLMEngine>>(cached_object);
                VLOG(2) << "Engine object successfully cast and stored in m_engine";
            }
            else
            {
                throw std::runtime_error("UUID not found in Python object cache");
            }
        }
        else
        {
            throw std::runtime_error("Invalid llm_engine format. Expected 'cached_object:[UUID]'");
        }
    }
    else
    {
        throw std::runtime_error("LLMEngineModule requires 'llm_engine' key in the config");
    }
}

void LLMEngineModule::initialize(mrc::segment::IBuilder& builder)
{
    // TODO(Devin): Convert to make_node for consistency & understanding - can use construct_object later, or
    //   better yet, improve make_node so it doesn't try to use LLMEngineNode as the SourceTypeT
    // auto llm_engine_node = builder.construct_object<LLMEngineNode>(m_engine_name, m_engine);
    auto llm_engine_node = builder.make_node<in_dtype_t, out_dtype_t, LLMEngineNode>(m_engine_name, m_engine);

    VLOG(2) << "LLMEngineModule::initialize(): " << std::endl << config().dump(2) << std::endl;
    std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> child_nodes;
    if (config().contains("engine_config"))
    {
        auto& engine_config = config()["engine_config"];
        child_nodes         = process_pipeline(engine_config, builder);
    }

    register_input_port("input", llm_engine_node);
    if (!child_nodes.empty())
    {
        builder.make_edge(llm_engine_node, child_nodes[0]);

        // Check if there are at least two nodes to create an edge
        if (child_nodes.size() > 1)
        {
            for (size_t i = 0; i < child_nodes.size() - 1; ++i)
            {
                // TODO(Devin): Can't directly resolve two ObjectProperties without some kind of typing. For now
                // assume children must use the same type as the EngineNode.
                builder.make_edge<out_dtype_t, out_dtype_t>(child_nodes[i], child_nodes[i + 1]);
            }
        }

        register_output_port("output", child_nodes.back());
    }
    else
    {
        register_output_port("output", llm_engine_node);
    }
}

std::string LLMEngineModule::module_type_name() const
{
    return std::string(::mrc::type_name<type_t>());
}
}  // namespace morpheus