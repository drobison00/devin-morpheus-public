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

/**
 * @brief Enum class representing different types of data records.
 */
enum class DataRecordType
{
    same,    ///< Represents a data record with the same type as the original.
    memory,  ///< Represents a memory-based data record.
    disk,    ///< Represents a disk-based data record.
    // Additional types can be added here.
};

/**
 * @brief Manages DataRecords with different storage backends.
 */
class DataManager
{
  public:
    ~DataManager() = default;
    DataManager()  = default;

    /**
     * @brief Creates a data record with the given type and data.
     *
     * @param type : The type of the data record.
     * @param bytes : A pointer to the raw byte data.
     * @param size : The size of the raw byte data.
     * @return The UUID of the created data record.
     */
    std::string create(DataRecordType type, const uint8_t* bytes, std::size_t size);

    /**
     * @brief Overloaded method to create a data record with a vector of bytes.
     *
     * @param type : The type of the data record.
     * @param bytes : A vector of bytes.
     * @return The UUID of the created data record.
     */
    std::string create(DataRecordType type, const std::vector<uint8_t>& bytes);

    /**
     * @brief Creates a data record with the given type and data.
     *
     * @param factory_func : A function that returns a unique_ptr to a DataRecord.
     * @param bytes : A pointer to the raw byte data.
     * @param size : The size of the raw byte data.
     * @return The UUID of the created data record.
     */
    std::string create(std::function<std::unique_ptr<DataRecord>()> factory_func,
                       const uint8_t* bytes,
                       std::size_t size);

    /**
     * @brief Overloaded method to create a data record with a vector of bytes.
     *
     * @param factory_func : A function that returns a unique_ptr to a DataRecord.
     * @param bytes : A vector of bytes.
     * @return The UUID of the created data record.
     */
    std::string create(std::function<std::unique_ptr<DataRecord>()> factory_func, const std::vector<uint8_t>& bytes);

    /**
     * @brief Creates a data record asynchronously with the given type and data.
     *
     * @param type : The type of the data record.
     * @param bytes : A pointer to the raw byte data.
     * @param size : The size of the raw byte data.
     * @return A std::future containing the UUID of the created data record.
     */
    std::future<std::string> create_async(DataRecordType type, const uint8_t* bytes, std::size_t size);

    /**
     * @brief Overloaded method to asynchronously create a data record with a vector of bytes.
     *
     * @param type : The type of the data record.
     * @param bytes : A vector of bytes.
     * @return A std::future containing the UUID of the created data record.
     */
    std::future<std::string> create_async(DataRecordType type, const std::vector<uint8_t>& bytes);

    /**
     * @brief Asynchronously creates a new DataRecord using a custom factory function.
     *
     * @param factory_func A function that returns a std::unique_ptr<DataRecord> when called.
     * @param bytes Pointer to the raw byte data to be stored.
     * @param size Size of the raw byte data in bytes.
     * @return std::future<std::string> Future that will hold the UUID of the created DataRecord.
     */
    std::future<std::string> create_async(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                          const uint8_t* bytes,
                                          std::size_t size);

    /**
     * @brief Asynchronously creates a new DataRecord using a custom factory function.
     *
     * @param factory_func A function that returns a std::unique_ptr<DataRecord> when called.
     * @param bytes std::vector containing the raw byte data to be stored.
     * @return std::future<std::string> Future that will hold the UUID of the created DataRecord.
     */
    std::future<std::string> create_async(std::function<std::unique_ptr<DataRecord>()> factory_func,
                                          const std::vector<uint8_t>& bytes);

    /**
     * @brief Retrieves the manifest containing all stored UUIDs.
     * @note not const, because we have to lock a mutex.
     *
     * @return A vector of UUID strings representing all stored data records.
     */
    std::vector<std::string> get_manifest();

    /**
     * @brief Reads data from a given UUID.
     *
     * @param uuid The UUID of the data record.
     * @return A tuple containing a shared_ptr to the data and its size.
     */
    std::tuple<std::shared_ptr<uint8_t>, std::size_t> read(const std::string& uuid);

    /**
     * @brief Asynchronously reads data from a given UUID.
     *
     * @param uuid The UUID of the data record.
     * @return A future that will contain a tuple of shared_ptr to the data and its size.
     */
    std::future<std::tuple<std::shared_ptr<uint8_t>, std::size_t>> read_async(const std::string& uuid);

    /**
     * @brief Deletes a data record with the given UUID.
     *
     * @param uuid : The UUID of the data record to delete.
     * @return True if the data record was successfully deleted, false otherwise.
     */
    bool remove(const std::string& uuid);

    /**
     * @brief Deletes a data record asynchronously with the given UUID.
     *
     * @param uuid : The UUID of the data record to delete.
     * @return A std::future containing a boolean indicating if the record was successfully deleted.
     */
    std::future<bool> remove_async(const std::string& uuid);

    /**
     * @brief Updates a data record with the given UUID, using raw byte data.
     *
     * @param uuid : The UUID of the data record to update.
     * @param bytes : A pointer to the raw bytes to use for the update.
     * @param size : The size in bytes of the data to update.
     */
    void update(const std::string& uuid, const uint8_t* bytes, std::size_t size);

    /**
     * @brief Updates a data record with the given UUID, using a std::vector of bytes.
     *
     * @param uuid : The UUID of the data record to update.
     * @param bytes : A std::vector containing the bytes to use for the update.
     */
    void update(const std::string& uuid, const std::vector<uint8_t>& bytes);

    /**
     * @brief Asynchronously updates a data record with the given UUID, using raw byte data.
     *
     * @param uuid : The UUID of the data record to update.
     * @param bytes : A pointer to the raw bytes to use for the update.
     * @param size : The size in bytes of the data to update.
     * @return A std::future representing the asynchronous operation.
     */
    std::future<void> update_async(const std::string& uuid, const uint8_t* bytes, std::size_t size);

    /**
     * @brief Asynchronously updates a data record with the given UUID, using a std::vector of bytes.
     *
     * @param uuid : The UUID of the data record to update.
     * @param bytes : A std::vector containing the bytes to use for the update.
     * @return A std::future representing the asynchronous operation.
     */
    std::future<void> update_async(const std::string& uuid, const std::vector<uint8_t>& bytes);

    /**
     * @brief Moves a data record with the given UUID to a different DataRecordType.
     *
     * @param uuid : The UUID of the data record to move.
     * @param new_type : The new DataRecordType to move the record to.
     */
    void move(const std::string& uuid, DataRecordType new_type);

    void move(const std::string& uuid, std::function<std::unique_ptr<DataRecord>()> factory_func);

    /**
     * @brief Asynchronously moves a data record with the given UUID to a different DataRecordType.
     *
     * @param uuid : The UUID of the data record to move.
     * @param new_type : The new DataRecordType to move the record to.
     * @return A std::future representing the asynchronous operation.
     */
    std::future<void> move_async(const std::string& uuid, DataRecordType new_type);

    std::future<void> move_async(const std::string& uuid, std::function<std::unique_ptr<DataRecord>()> factory_func);

  private:
    std::mutex m_mutex;
    std::map<std::string, std::unique_ptr<DataRecord>> m_records;

    std::string create_(std::function<std::unique_ptr<DataRecord>()> factory_func,
                        const uint8_t* bytes,
                        std::size_t size);

    void update_(const std::string& uuid, const uint8_t* bytes, std::size_t size);

    void move_(const std::string& uuid, std::function<std::unique_ptr<DataRecord>()> factory_func);
};

#pragma GCC visibility pop
}  // namespace morpheus::io
