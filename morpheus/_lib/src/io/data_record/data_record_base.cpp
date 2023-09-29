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

#include "morpheus/io/data_record/data_record_base.hpp"

#include <glog/logging.h>

namespace morpheus::io {
std::size_t DataRecord::size_bytes() const
{
    return m_size_bytes;
}

CacheManagerInterface& DataRecord::cache_interface()
{
    return m_cache_interface;
}

void DataRecord::cache_interface(const morpheus::io::CacheManagerInterface& new_cache_interface)
{
    m_cache_interface = new_cache_interface;
}

std::string DataRecord::uuid() const
{
    return m_uuid;
}

void DataRecord::uuid(const std::string& new_uuid)
{
    m_uuid = new_uuid;
}
}  // namespace morpheus::io
