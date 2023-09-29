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

#include "morpheus/io/data_record/memory_record.hpp"

#include <glog/logging.h>

namespace morpheus::io {
void MemoryRecord::create(const uint8_t* bytes, std::size_t size)
{
    if (bytes == nullptr) {
        throw std::runtime_error("Cannot create a memory record with null bytes");
    }

    // Create a shared_ptr and copy the data into it
    auto data = std::shared_ptr<uint8_t>(new uint8_t[size], std::default_delete<uint8_t[]>());
    std::memcpy(data.get(), bytes, size);

    // Store it using the CacheManagerInterface, pinned
    m_data       = m_cache_interface.store(m_uuid, data, size, true);
    m_size_bytes = size;
}

std::shared_ptr<uint8_t> MemoryRecord::read()
{
    // While we get back a weak pointer, it will always be pinned memory for a memory_record
    return m_data.lock();
}

void MemoryRecord::remove()
{
    m_cache_interface.evict(m_uuid);
}

void MemoryRecord::update(const uint8_t* bytes, std::size_t size)
{
    // Similar to create but updates the existing entry
    // May involve eviction and re-insertion
    remove();
    create(bytes, size);
}

std::string MemoryRecord::backing_store() const
{
    return "System Memory";
}

}  // namespace morpheus::io