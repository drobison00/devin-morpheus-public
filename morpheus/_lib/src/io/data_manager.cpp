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

#include "morpheus/io/data_record/data_record_base.hpp"
#include "morpheus/io/data_record/disk_record.hpp"
#include "morpheus/io/data_record/memory_record.hpp"

#include <glog/logging.h>

#include <memory>

namespace {
std::string data_record_type_to_string(morpheus::io::data_record_type type)
{
    switch (type)
    {
    case morpheus::io::data_record_type::memory:
        return "memory";
    case morpheus::io::data_record_type::disk:
        return "disk";
    default:
        return "unknown";
    }
}

std::unique_ptr<morpheus::io::DataRecord> create_data_record_by_type(morpheus::io::data_record_type type)
{
    switch (type)
    {
    case morpheus::io::data_record_type::memory:
        return std::make_unique<morpheus::io::MemoryRecord>();
    case morpheus::io::data_record_type::disk:
        return std::make_unique<morpheus::io::DiskRecord>();
    default:
        return nullptr;
    }
}
}  // namespace

namespace morpheus::io {

std::string DataManager::create(morpheus::io::data_record_type type, const uint8_t* bytes, std::size_t size)
{
    try
    {
        auto record = ::create_data_record_by_type(type);

        if (!record)
        {
            std::string error_msg = "Failed to create DataRecord object: " + ::data_record_type_to_string(type);
            LOG(ERROR) << error_msg;
            throw std::runtime_error(error_msg);
        }

        record->create(bytes, size);

        std::string uuid_str;
        bool is_unique = false;

        while (!is_unique)
        {
            auto uuid = boost::uuids::random_generator()();
            uuid_str  = boost::uuids::to_string(uuid);

            std::lock_guard<std::mutex> lock(m_mutex);
            if (m_records.find(uuid_str) == m_records.end())
            {
                m_records[uuid_str] = std::move(record);
                is_unique           = true;
            }
        }
        VLOG(30) << "Successfully created DataRecord with UUID";

        return uuid_str;
    } catch (const std::exception& e)
    {
        LOG(ERROR) << "Exception caught: " << e.what();
        throw;
    }
}

std::string DataManager::create(data_record_type type, const std::vector<uint8_t>& bytes)
{
    return create(type, bytes.data(), bytes.size());
}

std::future<std::string> DataManager::create_async(data_record_type type, const uint8_t* bytes, std::size_t size)
{
    using pointer_type_t = std::string (DataManager::*)(data_record_type, const uint8_t*, std::size_t);
    return std::async(std::launch::async, static_cast<pointer_type_t>(&DataManager::create), this, type, bytes, size);
}

std::future<std::string> DataManager::create_async(data_record_type type, const std::vector<uint8_t>& bytes)
{
    using pointer_type_t = std::string (DataManager::*)(data_record_type, const std::vector<uint8_t>&);
    return std::async(std::launch::async, static_cast<pointer_type_t>(&DataManager::create), this, type, bytes);
}

}  // namespace morpheus::io