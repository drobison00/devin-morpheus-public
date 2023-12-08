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

#include "morpheus/messages/control.hpp"

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

namespace morpheus {

template <typename SinkTypeT, typename SourceTypeT, typename ContextT>
class LLMEngineNode
  : public mrc::pymrc::AsyncioRunnable<std::shared_ptr<ControlMessage>, std::shared_ptr<ControlMessage>>
{
  public:
    LLMEngineNode(std::shared_ptr<llm::LLMEngine> engine) : m_engine(std::move(engine)) {}

    ~LLMEngineNode() override = default;

  private:
    mrc::coroutines::AsyncGenerator<std::shared_ptr<ControlMessage>> on_data(
        std::shared_ptr<ControlMessage>&& data) override
    {
        auto result = co_await m_engine->run(std::move(data));

        // Push the output messages
        for (auto&& out_message : result)
        {
            co_yield std::move(out_message);
        }

        co_return;
    }

    std::shared_ptr<llm::LLMEngine> m_engine;
};

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

namespace py = pybind11;
using json   = nlohmann::json;

// Assuming cpp_function_cache is defined
// TODO(Devin): For testing
std::map<std::string, std::function<std::shared_ptr<mrc::segment::ObjectProperties>(mrc::segment::IBuilder&)>>
    cpp_function_cache;

// Function to check if the py::object is a callable that takes a single argument
bool is_single_argument_callable(const py::object& obj)
{
    if (!py::getattr(py::module_::import("builtins"), "callable")(obj).cast<bool>())
    {
        return false;
    }

    py::object inspect    = py::module_::import("inspect");
    py::object signature  = inspect.attr("signature")(obj);
    py::object parameters = signature.attr("parameters");
    return py::len(parameters) == 1;
}

std::function<std::shared_ptr<mrc::segment::ObjectProperties>(mrc::segment::IBuilder&)> retrieve_cached_initializer(
    const std::string& uuid)
{
    auto& py_cache_handle = mrc::pymrc::PythonObjectCache::get_handle();

    if (py_cache_handle.contains(uuid))
    {
        py::object py_object = py_cache_handle.pop(uuid);

        if (!is_single_argument_callable(py_object))
        {
            throw std::runtime_error("Python object is not a single-argument callable");
        }

        // Return a lambda that wraps the Python object call
        return [py_object](mrc::segment::IBuilder& builder) -> std::shared_ptr<mrc::segment::ObjectProperties> {
            py::object result = py_object(builder);
            return py::cast<std::shared_ptr<mrc::segment::ObjectProperties>>(result);
        };
    }
    else if (cpp_function_cache.find(uuid) != cpp_function_cache.end())
    {
        // Return the std::function from the C++ cache
        return cpp_function_cache[uuid];
    }
    else
    {
        throw std::runtime_error("Cached initializer not found for UUID: " + uuid);
    }
}

std::shared_ptr<mrc::segment::ObjectProperties> process_child(const json& child,
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

std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> process_children(const json& engine_config,
                                                                              mrc::segment::IBuilder& builder)
{
    if (!engine_config["children"].is_array())
    {
        throw std::runtime_error("children must be a dictionary");
    }

    std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> child_nodes;
    std::regex uuid_regex("cache_object:([0-9a-fA-F-]{36})");
    std::smatch uuid_match;

    for (auto& child : engine_config["children"])
    {
        child_nodes.push_back(process_child(child, uuid_regex, uuid_match, builder));
    }

    return child_nodes;
}

void LLMEngineModule::initialize(mrc::segment::IBuilder& builder)
{
    // TODO(Devin): Convert to make_node for consistency & understanding - can use construct_object later, or
    //   better yet, improve make_node so it doesn't try to use LLMEngineNode as the SourceTypeT
    // auto llm_engine_node = builder.construct_object<LLMEngineNode>(m_engine_name, m_engine);
    auto llm_engine_node =
        builder.make_node<std::shared_ptr<ControlMessage>, std::shared_ptr<ControlMessage>, LLMEngineNode>(
            m_engine_name, m_engine);

    VLOG(2) << "LLMEngineModule::initialize(): " << std::endl << config().dump(2) << std::endl;
    std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> child_nodes;
    if (config().contains("engine_config"))
    {
        auto& engine_config = config()["engine_config"];
        child_nodes         = process_children(engine_config, builder);
    }

    if (!child_nodes.empty())
    {
        builder.make_edge(llm_engine_node, child_nodes[0]);
    }

    register_input_port("input", llm_engine_node);
    register_output_port("output", child_nodes[0]);
}

std::string LLMEngineModule::module_type_name() const
{
    return std::string(::mrc::type_name<type_t>());
}
}  // namespace morpheus