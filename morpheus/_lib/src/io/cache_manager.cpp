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

#include "morpheus/io/cache_manager.hpp"

#include <glog/logging.h>

#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>

namespace morpheus::io {

// CacheManager Implementation
CacheManager& CacheManager::instance()
{
    static CacheManager instance;
    return instance;
}

CacheManager::CacheManager() :
  m_max_cached_objects(0),
  m_max_cached_bytes(0),
  m_memory_utilization_threshold(0.8),
  m_total_cached_bytes(0)
{}

void CacheManager::set_max_cached_objects(std::size_t max)
{
    std::lock_guard<std::mutex> lock(m_global_mutex);
    m_max_cached_objects = max;
}

void CacheManager::set_max_cached_bytes(std::size_t max)
{
    std::lock_guard<std::mutex> lock(m_global_mutex);
    m_max_cached_bytes = max;
}

void CacheManager::set_memory_utilization_threshold(double percentage)
{
    std::lock_guard<std::mutex> lock(m_global_mutex);
    m_memory_utilization_threshold = percentage;
}

std::size_t CacheManager::get_max_cached_objects() const
{
    return m_max_cached_objects;
}

std::size_t CacheManager::get_max_cached_bytes() const
{
    return m_max_cached_bytes;
}

double CacheManager::get_memory_utilization_threshold() const
{
    return m_memory_utilization_threshold;
}

int CacheManager::allocate_cache_instance()
{
    std::lock_guard<std::mutex> lock(m_global_mutex);  // Lock to ensure thread-safety

    // Search for an available cache instance slot
    for (std::size_t i = 0; i < m_cache_instance_in_use.size(); ++i)
    {
        if (!m_cache_instance_in_use[i])
        {
            m_cache_instance_in_use[i] = true;  // Mark the instance as in use
            return static_cast<int>(i);         // Return the instance index
        }
    }

    // If no available slot, create a new unique_ptr to a CacheInstance
    m_cache_instances.emplace_back();

    // Mark the new instance as in use
    m_cache_instance_in_use.push_back(true);

    // Return the index of the new instance
    return static_cast<int>(m_cache_instances.size() - 1);
}

void CacheManager::free_cache_instance(int instance_id)
{
    std::lock_guard<std::mutex> lock(m_global_mutex);  // Lock to ensure thread-safety

    // Validate the instance_id
    if (instance_id < 0 || static_cast<std::size_t>(instance_id) >= m_cache_instance_in_use.size())
    {
        // Log error or throw exception
        std::string error_message = "Invalid instance ID passed to free_cache_instance";
        LOG(ERROR) << error_message;
        return;
    }

    // Mark the instance as no longer in use
    m_cache_instance_in_use[instance_id] = false;
}

void CacheManager::lru_evict()
{
    std::lock_guard<std::mutex> lock(m_global_mutex);

    for (auto& cache_instance : m_cache_instances)
    {
        std::lock_guard<std::mutex> instance_lock(*cache_instance.m_instance_mutex);

        if (cache_instance.m_cache.empty())
        {
            continue;
        }

        // Find the least recently used item
        auto lru_it = std::min_element(
            cache_instance.m_cache.begin(), cache_instance.m_cache.end(), [](const auto& a, const auto& b) {
                return a.second.last_access < b.second.last_access;
            });

        // Perform eviction
        if (lru_it != cache_instance.m_cache.end())
        {
            auto lru_key             = lru_it->first;
            std::size_t evicted_size = lru_it->second.data.use_count() == 1 ? lru_it->second.size : 0;  // TODO size

            // Remove the item from the cache
            cache_instance.m_cache.erase(lru_key);

            // Update the total cached bytes
            m_total_cached_bytes -= evicted_size;
        }
    }
}

void CacheManager::store(int instance_id, const std::string& uuid, std::shared_ptr<uint8_t> data)
{
    // Store the data in the specific cache instance identified by instance_id
    std::lock_guard<std::mutex> lock(m_global_mutex);

    m_cache_instances[instance_id].m_cache[uuid].data = data;
}

std::weak_ptr<uint8_t> CacheManager::get(int instance_id, const std::string& uuid)
{
    // Retrieve data from the specific cache instance
    std::lock_guard<std::mutex> lock(m_global_mutex);

    return m_cache_instances[instance_id].m_cache[uuid].data;
}

// CacheManagerInterface Implementation
CacheManagerInterface::CacheManagerInterface()
{
    // Allocate an instance ID for this interface
    m_instance_id = CacheManager::instance().allocate_cache_instance();
}

CacheManagerInterface::~CacheManagerInterface()
{
    // Free the allocated instance ID
    CacheManager::instance().free_cache_instance(m_instance_id);
}

std::weak_ptr<uint8_t> CacheManagerInterface::get(const std::string& uuid)
{
    return CacheManager::instance().get(m_instance_id, uuid);
}

void CacheManagerInterface::store(const std::string& uuid, std::shared_ptr<uint8_t> data)
{
    CacheManager::instance().store(m_instance_id, uuid, data);
}

}  // namespace morpheus::io