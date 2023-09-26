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
/**
 * @brief Abstract base class for a data record.
 *
 * This class defines the interface for a data record, which could be
 * stored in various backing stores like memory, disk, etc. It provides
 * methods to create, read, update, and remove the record.
 */
class DataRecord
{
  public:
    virtual ~DataRecord() = default;

    /**
     * @brief Create a new data record.
     *
     * This function is responsible for creating a new data record with the
     * given bytes and size.
     *
     * @param bytes Pointer to the byte array containing the data.
     * @param size Number of bytes in the array.
     */
    virtual void create(const uint8_t* bytes, std::size_t size) = 0;

    /**
     * @brief Read the data record.
     *
     * Reads the contents of the data record and returns it along with its size.
     *
     * @return A tuple containing a shared_ptr to the byte array and its size.
     */
    virtual std::shared_ptr<uint8_t> read() = 0;

    /**
     * @brief Update the data record.
     *
     * Updates the existing record with new bytes and size.
     *
     * @param bytes Pointer to the byte array containing the new data.
     * @param size Number of bytes in the new array.
     */
    virtual void update(const uint8_t* bytes, std::size_t size) = 0;

    /**
     * @brief Remove the data record.
     *
     * Removes or deletes the data record, freeing any resources it was using.
     */
    virtual void remove() = 0;

    /**
     * @brief Retrieve the type of the backing store.
     *
     * Returns a string representing the type of the backing store for this
     * record (e.g., "memory", "disk").
     *
     * @return A string indicating the type of the backing store.
     */
    virtual std::string backing_store() const = 0;

    /**
     * @brief Get the size of the record in bytes.
     *
     * Returns the size of the record data in bytes.
     *
     * @return The size of the record in bytes.
     */
    std::size_t size_bytes() const;

  protected:
    std::size_t m_size_bytes = 0;
};
}  // namespace morpheus::io