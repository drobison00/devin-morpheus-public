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

#include "rxcpp/operators/rx-map.hpp"

#include "morpheus/io/data_loader_registry.hpp"
#include "morpheus/messages/control.hpp"

#include <glog/logging.h>
#include <mrc/modules/segment_modules.hpp>
#include <mrc/node/rx_node.hpp>
#include <mrc/segment/builder.hpp>
#include <mrc/utils/type_utils.hpp>
#include <nlohmann/json.hpp>
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
LLMEngineModule::~LLMEngineModule() noexcept
{
    VLOG(30) << "DataLoaderModule::~DataLoaderModule(): " << name() << std::endl;
}

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

                // Cast the python object to std::shared_ptr<LLMEngine>
                m_engine = pybind11::cast<std::shared_ptr<llm::LLMEngine>>(cached_object);
                VLOG(2) << "Engine object casted and stored in m_engine";

                // Additional code to use m_engine as needed...
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
    auto llm_engine_node = builder.construct_object<LLMEngineNode>(m_engine_name, m_engine);

    register_input_port("input", llm_engine_node);
    register_output_port("output", llm_engine_node);
}

std::string LLMEngineModule::module_type_name() const
{
    return std::string(::mrc::type_name<type_t>());
}
}  // namespace morpheus