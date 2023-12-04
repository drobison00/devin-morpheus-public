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

#pragma once

#include "morpheus/export.h"
#include "morpheus/io/data_loader.hpp"
#include "morpheus/llm/input_map.hpp"
#include "morpheus/llm/llm_engine.hpp"
#include "morpheus/llm/llm_task_handler.hpp"
#include "morpheus/messages/control.hpp"
#include "morpheus/types.hpp"

#include <boost/fiber/fiber.hpp>
#include <boost/fiber/future/async.hpp>
#include <boost/fiber/future/future.hpp>
#include <boost/fiber/future/future_status.hpp>
#include <boost/fiber/future/promise.hpp>
#include <boost/fiber/policy.hpp>
#include <glog/logging.h>
#include <mrc/channel/status.hpp>
#include <mrc/coroutines/async_generator.hpp>
#include <mrc/coroutines/closable_ring_buffer.hpp>
#include <mrc/coroutines/concepts/awaitable.hpp>
#include <mrc/coroutines/detail/void_value.hpp>
#include <mrc/coroutines/schedule_on.hpp>
#include <mrc/coroutines/scheduler.hpp>
#include <mrc/coroutines/task.hpp>
#include <mrc/coroutines/task_container.hpp>
#include <mrc/modules/properties/persistent.hpp>
#include <mrc/modules/segment_modules.hpp>
#include <mrc/node/sink_channel_owner.hpp>
#include <mrc/node/sink_properties.hpp>
#include <mrc/node/source_channel_owner.hpp>
#include <mrc/node/source_properties.hpp>
#include <mrc/runnable/context.hpp>
#include <mrc/runnable/forward.hpp>
#include <mrc/runnable/runnable.hpp>
#include <mrc/segment/builder.hpp>
#include <mrc/segment/object.hpp>
#include <nlohmann/json.hpp>
#include <pybind11/gil.h>
#include <pybind11/pybind11.h>
#include <pybind11/pytypes.h>
#include <pymrc/asyncio_runnable.hpp>
#include <pymrc/coro.hpp>
#include <pymrc/types.hpp>
#include <pymrc/utilities/acquire_gil.hpp>

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <coroutine>
#include <cstddef>
#include <functional>
#include <map>
#include <memory>
#include <mutex>
#include <ratio>
#include <stdexcept>
#include <stop_token>
#include <string>
#include <utility>

namespace morpheus {
#pragma GCC visibility push(default)
class LLMEngineModule : public mrc::modules::SegmentModule, public mrc::modules::PersistentModule
{
    using type_t = LLMEngineModule;

  public:
    ~LLMEngineModule() override;

    LLMEngineModule(std::string module_name) = delete;
    LLMEngineModule(std::string module_name, nlohmann::json _config);

  protected:
    void initialize(mrc::segment::IBuilder& builder) override;
    std::string module_type_name() const override;

  private:
    std::string m_engine_name{};
    std::shared_ptr<llm::LLMEngine> m_engine;
};
#pragma GCC visibility pop
}  // namespace morpheus