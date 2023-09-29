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

#include "data_record_base.hpp"

#include "morpheus/io/cache_manager.hpp"

#include <cstdint>
#include <memory>

namespace morpheus::io {
#pragma GCC visibility push(default)
class MemoryRecord : public DataRecord
{
  public:
    MemoryRecord() = default;

    /**
     * @brief Creates a new data record in memory.
     *
     * This method will allocate memory and copy the provided byte data into it.
     *
     * @param bytes : Pointer to the byte data to store.
     * @param size : Size of the data to store, in bytes.
     */
    void create(const uint8_t* bytes, std::size_t size) override;

    /**
     * @brief Reads the data record from memory.
     *
     * Returns a shared_ptr to the data stored in memory.
     *
     * @return A std::shared_ptr<uint8_t> containing the stored data.
     */
    std::shared_ptr<uint8_t> read() override;

    /**
     * @brief Removes the data record from memory.
     *
     * This method will free the memory occupied by the data record.
     */
    void remove() override;

    /**
     * @brief Updates the data record in memory.
     *
     * This method will reallocate memory and copy the new byte data into it.
     *
     * @param bytes : Pointer to the new byte data to store.
     * @param size : Size of the new data to store, in bytes.
     */
    void update(const uint8_t* bytes, std::size_t size) override;

    /**
     * @brief Returns the type of backing store used for this data record.
     *
     * For a MemoryRecord, this will always return "Memory".
     *
     * @return A string representing the type of backing store.
     */
    std::string backing_store() const override;
};
#pragma GCC visibility pop
}  // namespace morpheus::io