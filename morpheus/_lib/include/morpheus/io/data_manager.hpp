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
enum class DataRecordType {
    memory,  ///< Represents a memory-based data record.
    disk,    ///< Represents a disk-based data record.
    // Additional types can be added here.
};

/**
 * @brief Converts an enum value of type DataRecordType to its string representation.
 *
 * @param type : The type of data record.
 * @return The string representation of the data record type.
 */
std::string data_record_type_to_string(DataRecordType type);

/**
 * @brief Manages DataRecords with different storage backends.
 */
class DataManager {
  public:
    ~DataManager() = default;
    DataManager() = default;

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
   * @brief Retrieves the manifest containing all stored UUIDs.
   * @note not const, because we have to lock a mutex.
   *
   * @return A vector of UUID strings representing all stored data records.
     */
    std::vector<std::string> get_manifest();

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

  private:
    std::mutex m_mutex;
    std::map<std::string, std::unique_ptr<DataRecord>> m_records;
};

#pragma GCC visibility pop
}  // namespace morpheus::io
