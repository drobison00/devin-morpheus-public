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
#include <mutex>

namespace {
std::string data_record_type_to_string(morpheus::io::DataRecordType type)
{
    switch (type)
    {
    case morpheus::io::DataRecordType::memory:
        return "memory";
    case morpheus::io::DataRecordType::disk:
        return "disk";
    default:
        return "unknown";
    }
}

std::unique_ptr<morpheus::io::DataRecord> create_data_record_by_type(morpheus::io::DataRecordType type)
{
    switch (type)
    {
    case morpheus::io::DataRecordType::memory:
        return std::make_unique<morpheus::io::MemoryRecord>();
    case morpheus::io::DataRecordType::disk:
        return std::make_unique<morpheus::io::DiskRecord>();
    default:
        return nullptr;
    }
}
}  // namespace

namespace morpheus::io {

std::string DataManager::create_(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                 const uint8_t* bytes,
                                 std::size_t size)
{
    auto record = factory_func();

    if (!record)
    {
        LOG(ERROR) << "Failed to create DataRecord object using factory function";
        throw std::runtime_error("Failed to create DataRecord object using factory function");
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
}

std::string DataManager::create(morpheus::io::DataRecordType type, const uint8_t* bytes, std::size_t size)
{
    return create_([type]() { return ::create_data_record_by_type(type); }, bytes, size);
}

std::string DataManager::create(DataRecordType type, const std::vector<uint8_t>& bytes)
{
    return create(type, bytes.data(), bytes.size());
}

std::string DataManager::create(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                const uint8_t* bytes,
                                std::size_t size)
{
    return create_(factory_func, bytes, size);
}

std::string DataManager::create(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                const std::vector<uint8_t>& bytes)
{
    return create_(factory_func, bytes.data(), bytes.size());
}

std::future<std::string> DataManager::create_async(DataRecordType type, const uint8_t* bytes, std::size_t size)
{
    using pointer_type_t = std::string (DataManager::*)(DataRecordType, const uint8_t*, std::size_t);
    return std::async(std::launch::async, static_cast<pointer_type_t>(&DataManager::create), this, type, bytes, size);
}

std::future<std::string> DataManager::create_async(DataRecordType type, const std::vector<uint8_t>& bytes)
{
    using pointer_type_t = std::string (DataManager::*)(DataRecordType, const std::vector<uint8_t>&);
    return std::async(std::launch::async, static_cast<pointer_type_t>(&DataManager::create), this, type, bytes);
}

std::future<std::string> DataManager::create_async(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                                   const uint8_t* bytes,
                                                   std::size_t size)
{
    using pointer_type_t =
        std::string (DataManager::*)(std::function<std::unique_ptr<DataRecord>()>, const uint8_t*, std::size_t);
    return std::async(
        std::launch::async, static_cast<pointer_type_t>(&DataManager::create), this, factory_func, bytes, size);
}

std::future<std::string> DataManager::create_async(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                                   const std::vector<uint8_t>& bytes)
{
    using pointer_type_t =
        std::string (DataManager::*)(std::function<std::unique_ptr<DataRecord>()>, const std::vector<uint8_t>&);
    return std::async(std::launch::async, static_cast<pointer_type_t>(&DataManager::create), this, factory_func, bytes);
}

std::vector<std::string> DataManager::get_manifest()
{
    std::lock_guard<std::mutex> lock(m_mutex);
    std::vector<std::string> manifest;

    for (const auto& [uuid, _] : m_records)
    {
        manifest.push_back(uuid);
    }

    return manifest;
}

std::tuple<std::shared_ptr<uint8_t>, std::size_t> DataManager::read(const std::string& uuid)
{
    std::lock_guard<std::mutex> lock(m_mutex);
    auto it = m_records.find(uuid);
    if (it == m_records.end())
    {
        throw std::runtime_error("Record not found");
    }

    std::size_t size = it->second->size_bytes();
    auto data        = it->second->read();

    return std::make_tuple(data, size);
}

std::future<std::tuple<std::shared_ptr<uint8_t>, std::size_t>> DataManager::read_async(const std::string& uuid)
{
    return std::async(std::launch::async, [this, uuid]() { return this->read(uuid); });
}

bool DataManager::remove(const std::string& uuid_str)
{
    std::lock_guard<std::mutex> lock(m_mutex);

    auto it = m_records.find(uuid_str);
    if (it != m_records.end())
    {
        it->second->remove();
        m_records.erase(it);
        return true;
    }

    return false;
}

std::future<bool> DataManager::remove_async(const std::string& uuid_str)
{
    return std::async(std::launch::async, &DataManager::remove, this, uuid_str);
}

/** Update **/

// Update APIs

void DataManager::update(const std::string& uuid, const uint8_t* bytes, std::size_t size)
{
    update_(uuid, bytes, size);
}

void DataManager::update(const std::string& uuid, const std::vector<uint8_t>& bytes)
{
    update_(uuid, bytes.data(), bytes.size());
}

std::future<void> DataManager::update_async(const std::string& uuid, const uint8_t* bytes, std::size_t size)
{
    return std::async(std::launch::async, &DataManager::update_, this, uuid, bytes, size);
}

std::future<void> DataManager::update_async(const std::string& uuid, const std::vector<uint8_t>& bytes)
{
    return std::async(std::launch::async, &DataManager::update_, this, uuid, bytes.data(), bytes.size());
}

// Move APIs

void DataManager::move(const std::string& uuid, DataRecordType new_type)
{
    move_(uuid, [new_type]() { return ::create_data_record_by_type(new_type); });
}

void DataManager::move(const std::string& uuid, std::function<std::unique_ptr<DataRecord>()> factory_func)
{
    move_(uuid, factory_func);
}

std::future<void> DataManager::move_async(const std::string& uuid, DataRecordType new_type)
{
    return std::async(std::launch::async, &DataManager::move_, this, uuid, [new_type]() {
        return ::create_data_record_by_type(new_type);
    });
}

std::future<void> DataManager::move_async(const std::string& uuid,
                                          std::function<std::unique_ptr<DataRecord>()> factory_func)
{
    return std::async(std::launch::async, &DataManager::move_, this, uuid, factory_func);
}

/** Private Methods **/

void DataManager::move_(const std::string& uuid, std::function<std::unique_ptr<DataRecord>()> factory_func)
{
    std::lock_guard<std::mutex> lock(m_mutex);

    auto it = m_records.find(uuid);
    if (it == m_records.end())
    {
        std::string error_message = "Record with UUID " + uuid + " not found.";
        LOG(ERROR) << error_message;

        throw std::runtime_error(error_message);
    }

    try
    {
        auto new_record = factory_func();
        if (!new_record)
        {
            std::string error_message = "Failed to create new DataRecord";
            LOG(ERROR) << error_message;

            throw std::runtime_error(error_message);
        }

        // Copy data from old record to new one
        auto sp_data = it->second->read();
        auto size    = it->second->size_bytes();
        new_record->update(sp_data.get(), size);

        // Replace the old record with the new one
        it->second->remove();
        it->second = std::move(new_record);
    } catch (const std::exception& e)
    {
        std::string error_message = "Exception caught during move: " + std::string(e.what());
        LOG(ERROR) << error_message;

        throw;
    }
}

void DataManager::update_(const std::string& uuid, const uint8_t* bytes, std::size_t size_bytes)
{
    std::lock_guard<std::mutex> lock(m_mutex);

    auto it = m_records.find(uuid);
    if (it == m_records.end())
    {
        std::string error_message = "Record with UUID " + uuid + " not found.";
        LOG(ERROR) << error_message;

        throw std::runtime_error(error_message);
    }

    try
    {
        it->second->update(bytes, size_bytes);

    } catch (const std::exception& e)
    {
        std::string error_message = "Exception caught during update: " + std::string(e.what());
        LOG(ERROR) << error_message;

        throw;
    }
}

}  // namespace morpheus::io