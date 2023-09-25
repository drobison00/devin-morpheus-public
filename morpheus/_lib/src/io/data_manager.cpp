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

#include "morpheus/io/data_manager.hpp"

#include <glog/logging.h>

#include <memory>

namespace morpheus::io {
std::string data_record_type_to_string(data_record_type type)
{
    switch (type)
    {
    case data_record_type::memory:
        return "memory";
    case data_record_type::disk:
        return "disk";
    default:
        return "unknown";
    }
}

std::shared_ptr<DataRecord> DataManager::create(morpheus::io::data_record_type type, const std::vector<uint8_t>& data)
{
    try
    {
        std::unique_ptr<DataRecord> record = create_data_record_by_type(type);
        if (!record)
        {
            std::string error_msg = "Failed to create DataRecord object: " + data_record_type_to_string(type);
            LOG(ERROR) << error_msg;
            throw std::runtime_error(error_msg);
        }

        if (!record->create(data))
        {
            std::string error_msg = "Failed to created DataRecord: " + data_record_type_to_string(type);
            LOG(ERROR) << error_msg;
            throw std::runtime_error(error_msg);
        }

        auto uuid = boost::uuids::random_generator()();
        std::string uuid_str = boost::uuids::to_string(uuid);
        if (m_records.find(uuid_str) != m_records.end())
        {
            std::string error_msg = "UUID collision, very unlikely but still possible";
            LOG(ERROR) << error_msg;
            throw std::runtime_error(error_msg);
        }

        m_records[uuid_str] = std::move(record);
        LOG(INFO) << "Successfully created DataRecord with UUID";
        return record;
    } catch (const std::exception& e)
    {
        LOG(ERROR) << "Exception caught: " << e.what();
        throw;
    }
}

std::unique_ptr<DataRecord> DataManager::create_data_record_by_type(morpheus::io::data_record_type type)
{
    switch (type)
    {
    case data_record_type::memory:
        return std::make_unique<MemoryRecord>();
    case data_record_type::disk:
        return std::make_unique<DiskRecord>();
    default:
        return nullptr;
    }
}

}  // namespace morpheus::io