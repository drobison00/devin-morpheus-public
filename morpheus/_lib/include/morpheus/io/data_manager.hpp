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
#include "data_record/disk_record.hpp"
#include "data_record/memory_record.hpp"

#include <boost/uuid/uuid.hpp>
#include <boost/uuid/uuid_generators.hpp>
#include <boost/uuid/uuid_io.hpp>

#include <iostream>
#include <map>
#include <memory>
#include <random>
#include <string>
#include <vector>

namespace morpheus::io {
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
    DataManager() = default;

    std::optional<std::string> create(data_record_type type, const std::vector<uint8_t>& data);

  private:
    std::unique_ptr<DataRecord> create_data_record_by_type(data_record_type type);
    std::map<std::string, std::unique_ptr<DataRecord>> m_records;
};
}  // namespace morpheus::io