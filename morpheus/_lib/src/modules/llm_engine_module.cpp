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
#include <mrc/coroutines/task.hpp>
#include <mrc/modules/segment_modules.hpp>
#include <mrc/segment/builder.hpp>
#include <mrc/segment/object.hpp>
#include <mrc/utils/type_utils.hpp>
#include <nlohmann/json.hpp>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
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

// TODO(Devin): Hack to retrieve an async python function
py::object retrieve_cached_executor(const std::string& uuid)
{
    VLOG(2) << "Attempting to retrieve cached executor for UUID: " << uuid;
    auto& py_cache_handle = mrc::pymrc::PythonObjectCache::get_handle();

    if (py_cache_handle.contains(uuid))
    {
        py::object py_object = py_cache_handle.pop(uuid);
        VLOG(2) << "Executor retrieved for UUID: " << uuid;
        return py_object;
    }
    else
    {
        VLOG(1) << "Cached initializer not found for UUID: " << uuid;
        throw std::runtime_error("Cached initializer not found for UUID: " + uuid);
    }
}

template <typename SinkTypeT, typename SourceTypeT, typename ContextT>
class LLMEngineNode
  : public mrc::pymrc::AsyncioRunnable<std::shared_ptr<ControlMessage>, std::shared_ptr<llm::LLMContext>>
{
  public:
    LLMEngineNode() = default;
    ~LLMEngineNode() override = default;

  private:
    mrc::coroutines::AsyncGenerator<std::shared_ptr<llm::LLMContext>> on_data(
        std::shared_ptr<ControlMessage>&& data) override
    {
        VLOG(2) << "LLMEngineNode::on_data() called";

        /* TODO(Devin): Implement the LLMTask/LLMContext creation here. */
        std::vector<std::shared_ptr<llm::LLMContext>> output_contexts;
        if (!data)
        {
            VLOG(2) << "LLMEngineNode::on_data() called with a null message";
            throw std::runtime_error("LLMEngineNode::on_data() called with a null message");
        }

        if (!data->has_task("llm_engine"))
        {
            VLOG(2) << "LLMEngineNode::on_data() message does not have the 'llm_engine' task";
            throw std::runtime_error("LLMEngineNode::on_data() called with a message that does not have the 'llm_engine' task");
        }
        else
        {
            while (data->has_task("llm_engine"))
            {
                auto current_task = data->remove_task("llm_engine");
                llm::LLMTask tmp_task(current_task["task_type"].get<std::string>(), current_task.at("task_dict"));
                auto context = std::make_shared<llm::LLMContext>(tmp_task, data);
                output_contexts.push_back(context);
            }
        }

        for (auto&& out_context : output_contexts)
        {
            co_yield std::move(out_context);
        }

        co_return;
    }
};

template <typename SinkTypeT, typename SourceTypeT, typename ContextT>
class LLMAsyncPipelineNode
  : public mrc::pymrc::AsyncioRunnable<std::shared_ptr<llm::LLMContext>, std::shared_ptr<llm::LLMContext>>
{
  public:
    ~LLMAsyncPipelineNode() override
    {
        VLOG(10) << "LLMAsyncPipelineNode::~LLMAsyncPipelineNode() called";
    }

    LLMAsyncPipelineNode(pybind11::function on_data_func)
    {
        VLOG(2) << "LLMAsyncPipelineNode constructor called";
        py::gil_scoped_acquire gil;
        m_on_data_func = std::move(on_data_func);

        auto asyncio = pybind11::module_::import("asyncio");
        auto at_exit = pybind11::module_::import("atexit");

        if (!m_on_data_func)
        {
            VLOG(1) << "LLMAsyncPipelineNode called with a null function";
            throw std::runtime_error("LLMAsyncPipelineNode::LLMAsyncPipelineNode() called with a null function");
        }

        if (!asyncio.attr("iscoroutinefunction")(m_on_data_func).cast<bool>())
        {
            VLOG(1) << "Function provided to LLMAsyncPipelineNode is not a coroutine function";
            throw std::invalid_argument(MORPHEUS_CONCAT_STR(
                "Invalid function '" << py::str(m_on_data_func) << "'. Function must be a coroutine function"));
        }

        at_exit.attr("register")(pybind11::cpp_function([this]() {
            this->atexit_callback();
        }));
    }

  private:
    pybind11::function m_on_data_func;

    mrc::coroutines::AsyncGenerator<std::shared_ptr<llm::LLMContext>> on_data(
        std::shared_ptr<llm::LLMContext>&& context) override
    {
        VLOG(2) << "LLMAsyncPipelineNode::on_data() called";
        py::gil_scoped_acquire gil;

        auto py_coro = m_on_data_func(std::move(context));

        auto asyncio_module = pybind11::module::import("asyncio");
        if (!asyncio_module.attr("iscoroutine")(py_coro).cast<bool>())
        {
            VLOG(1) << "Return value from LLMAsyncPipelineNode function is not a coroutine";
            pybind11::pybind11_fail(MORPHEUS_CONCAT_STR(
                "Return value from LLMAsyncPipelineNode function did not return a coroutine. Returned: "
                << py::str(py_coro).cast<std::string>()));
        }

        auto o_task = asyncio_module.attr("create_task")(py_coro);
        mrc::pymrc::PyHolder o_result;
        {
            pybind11::gil_scoped_release nogil;
            o_result = co_await mrc::pymrc::coro::PyTaskToCppAwaitable(std::move(o_task));
            DCHECK_EQ(PyGILState_Check(), 0) << "Should not have the GIL after returning from co_await";
        }

        VLOG(2) << "LLMAsyncPipelineNode::on_data() calling co_yield";
        co_yield context;

        VLOG(2) << "LLMAsyncPipelineNode::on_data() calling co_return";
        co_return;
    }

    void atexit_callback()
    {
        VLOG(10) << "LLMAsyncPipelineNode::atexit_callback() called";
        py::gil_scoped_acquire gil;
        m_on_data_func.dec_ref();
        m_on_data_func.release();
        VLOG(10) << "LLMAsyncPipelineNode::atexit_callback() completed";
    }
};

std::shared_ptr<mrc::segment::ObjectProperties> process_node(const json& child,
                                                             const std::regex& uuid_regex,
                                                             std::smatch& uuid_match,
                                                             mrc::segment::IBuilder& builder)
{
    if (!(child.contains("node") || child.contains("async_node")) || !child.contains("name"))
    {
        VLOG(1) << "Invalid child configuration: missing 'node'/'async_node' or 'name' key.";
        throw std::runtime_error("Each child must contain a 'node' or 'async_node' and a 'name' key.");
    }

    if (!child["name"].is_string())
    {
        VLOG(1) << "Invalid 'name' type: must be a string.";
        throw std::runtime_error("'name' must be a string.");
    }

    std::string name = child["name"];
    std::string node;
    bool is_async = false;

    if (child.contains("node"))
    {
        node = child["node"];
    }
    else
    {
        node     = child["async_node"];
        is_async = true;
    }

    if (!std::regex_match(node, uuid_match, uuid_regex))
    {
        VLOG(1) << "Node format mismatch: expected 'cache_object:[UUID]'";
        throw std::runtime_error("'node' does not match the required format 'cache_object:[UUID]'.");
    }

    std::string uuid = uuid_match[1].str();

    if (is_async)
    {
        auto executor = retrieve_cached_executor(uuid);
        /* Create the async node */
        auto async_node =
            builder.make_node<std::shared_ptr<llm::LLMContext>, std::shared_ptr<llm::LLMContext>, LLMAsyncPipelineNode>(
                name, executor);

        return async_node;
    }
    else
    {
        auto initializer = retrieve_cached_initializer(uuid);
        /* Create the node */
        auto sync_node = initializer(builder);

        return sync_node;
    }
}

std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> process_pipeline(const json& engine_config,
                                                                              mrc::segment::IBuilder& builder)
{
    if (engine_config.contains("pipeline") && !engine_config["pipeline"].is_array())
    {
        VLOG(1) << "Invalid engine_config: 'pipeline' should be an array.";
        throw std::runtime_error("LLM Pipeline definition should contain a list of node elements.");
    }

    std::vector<std::shared_ptr<mrc::segment::ObjectProperties>> child_nodes;
    // TODO(Devin): This is a hack to retrieve the UUID from the config, we should have a better way to do this.
    std::regex uuid_regex("cache_object:([0-9a-fA-F-]{36})");
    std::smatch uuid_match;

    for (const auto& pipeline_node : engine_config["pipeline"])
    {
        try
        {
            // TODO(Devin): Need declarative (textual) and imperative versions of this.
            child_nodes.push_back(process_node(pipeline_node, uuid_regex, uuid_match, builder));
        } catch (const std::exception& e)
        {
            VLOG(1) << "Exception in processing pipeline node: " << e.what();
            // Rethrow or handle the exception as needed
            throw;
        }
    }

    return child_nodes;
}
}  // namespace

namespace morpheus {

LLMEngineModule::~LLMEngineModule() noexcept
{
    VLOG(30) << "LLMEngineModule::~LLMEngineModule(): " << name() << std::endl;
}

LLMEngineModule::LLMEngineModule(std::string module_name, nlohmann::json _config) :
  SegmentModule(std::move(module_name), std::move(_config))
{
    /* TODO(Devin): m_engine does not fit the normal design pattern, we don't need it to construct an LLMEngine module.
     * if (config().contains("llm_engine"))
     * {
     *     auto engine_config = config()["llm_engine"].get<std::string>();
     *     std::regex uuid_regex("cache_object:([0-9a-fA-F-]{36})");
     *     std::smatch uuid_match;
     *     if (std::regex_search(engine_config, uuid_match, uuid_regex))
     *     {
     *         std::string uuid   = uuid_match[1];
     *         auto& cache_handle = mrc::pymrc::PythonObjectCache::get_handle();
     *
     *         if (cache_handle.contains(uuid))
     *         {
     *             auto cached_object = cache_handle.pop(uuid);
     *             m_engine           = pybind11::cast<std::shared_ptr<llm::LLMEngine>>(cached_object);
     *             VLOG(2) << "Engine object successfully cast and stored in m_engine";
     *         }
     *         else
     *         {
     *             VLOG(1) << "UUID not found in Python object cache";
     *             throw std::runtime_error("UUID not found in Python object cache");
     *         }
     *     }
     *     else
     *     {
     *         VLOG(1) << "Invalid llm_engine format. Expected 'cached_object:[UUID]'";
     *         throw std::runtime_error("Invalid llm_engine format. Expected 'cached_object:[UUID]'");
     *     }
     * }
     * else
     * {
     *     VLOG(1) << "LLMEngineModule requires 'llm_engine' key in the config";
     *     throw std::runtime_error("LLMEngineModule requires 'llm_engine' key in the config");
     * }
     */
}

void LLMEngineModule::initialize(mrc::segment::IBuilder& builder)
{
    /* TODO(Devin): Convert to make_node for consistency & understanding - can use construct_object later, or
     *   better yet, improve make_node so it doesn't try to use LLMEngineNode as the SourceTypeT
     * auto llm_engine_node = builder.construct_object<LLMEngineNode>(m_engine_name, m_engine);
     */
    auto llm_engine_node = builder.make_node<in_dtype_t, out_dtype_t, LLMEngineNode>(m_engine_name);

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
                /* TODO(Devin): Can't directly resolve two ObjectProperties without some kind of typing. For now
                 * assume children must use the same type as the EngineNode.
                 */
                builder.make_edge<out_dtype_t, out_dtype_t>(child_nodes[i], child_nodes[i + 1]);
            }
        }

        register_output_port("output", child_nodes.back());
    }
    else
    {
        VLOG(2) << "No child nodes found, registering output port to llm_engine_node";
        register_output_port("output", llm_engine_node);
    }
}

std::string LLMEngineModule::module_type_name() const
{
    return std::string(::mrc::type_name<type_t>());
}
}  // namespace morpheus