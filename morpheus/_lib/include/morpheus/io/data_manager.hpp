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

#include "data_record/data_record_base.hpp"

#include <boost/uuid/uuid.hpp>
#include <boost/uuid/uuid_generators.hpp>
#include <boost/uuid/uuid_io.hpp>

#include <cstdint>
#include <future>
#include <iostream>
#include <map>
#include <memory>
#include <string>
#include <vector>

namespace morpheus::io {
#pragma GCC visibility push(default)
enum class data_record_type
{
    memory,
    disk,
    // s3
    // redis
    // fsspec
    // memory_mapped io(?)
};

std::string data_record_type_to_string(data_record_type type);

class DataManager
{
  public:
    ~DataManager() = default;
    DataManager() = default;

    std::string create(data_record_type type, const uint8_t* bytes, std::size_t size);
    std::string create(data_record_type type, const std::vector<uint8_t>& bytes);

    std::future<std::string> create_async(data_record_type type, const uint8_t* bytes, std::size_t size);
    std::future<std::string> create_async(data_record_type type, const std::vector<uint8_t>& bytes);


  private:
    std::mutex m_mutex;
    std::map<std::string, std::unique_ptr<DataRecord>> m_records;
};
#pragma GCC visibility pop
}  // namespace morpheus::io