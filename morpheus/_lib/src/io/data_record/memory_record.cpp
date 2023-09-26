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
    if (bytes == nullptr || size <= 0)
    {
        std::string error_message = "Failed to create 'memory' record: invalid data pointer";
        LOG(ERROR) << error_message;
        throw std::runtime_error(error_message);
    }

    m_data.reset(new uint8_t[size], std::default_delete<uint8_t[]>());
    std::memcpy(m_data.get(), bytes, size);

    m_size_bytes = size;
}

std::shared_ptr<uint8_t> MemoryRecord::read()
{
    if (!m_data)
    {
        std::string error_message = "Failed to read 'memory' record: invalid data pointer";
        LOG(ERROR) << error_message;
        throw std::runtime_error(error_message);
    }

    return m_data;
}

void MemoryRecord::remove()
{
    m_data.reset();
    m_size_bytes = 0;
}

void MemoryRecord::update(const uint8_t* bytes, std::size_t size)
{
    if (bytes == nullptr || size <= 0)
    {
        std::string error_message = "Failed to update 'memory' record: invalid data pointer";
        LOG(ERROR) << error_message;
        throw std::runtime_error(error_message);
    }

    m_data.reset(new uint8_t[size], std::default_delete<uint8_t[]>());
    std::memcpy(m_data.get(), bytes, size);
    m_size_bytes = size;
}

std::string MemoryRecord::backing_store() const
{
    return "System Memory";
}

}  // namespace morpheus::io