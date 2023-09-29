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

#include "data_record_base.hpp"

namespace morpheus::io {
#pragma GCC visibility push(default)
class DiskRecord : public DataRecord
{
    void create(const uint8_t* bytes, std::size_t size) override;
    std::shared_ptr<uint8_t> read() override;
    void remove() override;
    void update(const uint8_t* bytes, std::size_t size) override;

    std::string backing_store() const override;
};
#pragma GCC visibility pop
}  // namespace morpheus::io
