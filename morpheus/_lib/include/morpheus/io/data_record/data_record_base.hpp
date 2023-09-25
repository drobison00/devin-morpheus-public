/*
 * SPDX-FileCopyrightText: Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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

#include <cstdint>
#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace morpheus::io {
class DataRecord
{
  public:
    virtual ~DataRecord()                                       = default;
    virtual void create(const uint8_t* bytes, std::size_t size) = 0;
    virtual std::shared_ptr<uint8_t> read()                     = 0;
    // virtual std::optional<bool> Update(const std::vector<uint8_t>& new_data) = 0;
    virtual void remove() = 0;

    virtual std::string backing_store() const = 0;

    std::size_t size_bytes() const;

  protected:
    std::size_t m_size_bytes = 0;
};
}  // namespace morpheus::io