/*
 * SPDX-FileCopyrightText: Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
#include "morpheus/llm/fwd.hpp"
#include "morpheus/types.hpp"

#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace morpheus::llm {

class MORPHEUS_EXPORT LLMTaskHandler
{
  public:
    using return_t = std::optional<std::vector<std::shared_ptr<ControlMessage>>>;

    virtual ~LLMTaskHandler() = default;

    virtual std::vector<std::string> get_input_names() const               = 0;
    virtual Task<return_t> try_handle(std::shared_ptr<LLMContext> context) = 0;
};

}  // namespace morpheus::llm