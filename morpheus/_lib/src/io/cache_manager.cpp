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
    m_dirty.store(true);

    // Search for an available cache instance slot
    for (std::size_t i = 0; i < m_cache_instance_in_use.size(); ++i)
    {
        if (!m_cache_instance_in_use[i])
        {
            m_cache_instance_in_use[i]->store(true);  // Mark the instance as in use
            return static_cast<int>(i);               // Return the instance index
        }
    }

    auto instance = std::make_unique<CacheInstance>();

    // If no available slot, create a new unique_ptr to a CacheInstance
    m_cache_instances.push_back(std::move(instance));

    // Mark the new instance as in use
    auto new_instance_index = std::make_unique<std::atomic<bool>>(true);
    m_cache_instance_in_use.push_back(std::move(new_instance_index));

    // Return the index of the new instance
    return static_cast<int>(m_cache_instances.size() - 1);
}

void CacheManager::free_cache_instance(int instance_id)
{
    // Validate the instance_id
    if (instance_id < 0 || static_cast<std::size_t>(instance_id) >= m_cache_instance_in_use.size())
    {
        // Log error or throw exception
        std::string error_message = "Invalid instance ID passed to free_cache_instance";
        LOG(ERROR) << error_message;
        return;
    }

    // Lock the instance to safely reset its state
    std::lock_guard<std::mutex> instance_lock(m_cache_instances[instance_id]->m_instance_mutex);

    // Reset instance properties and statistics
    m_cache_instances[instance_id]->reset();

    // Mark the instance as no longer in use
    m_cache_instance_in_use[instance_id]->store(false);

    m_dirty.store(true);
}

void CacheManager::lru_evict()
{
    std::lock_guard<std::mutex> lock(m_global_mutex);

    for (auto& cache_instance : m_cache_instances)
    {
        std::lock_guard<std::mutex> instance_lock(cache_instance->m_instance_mutex);

        if (cache_instance->m_cache.empty())
        {
            continue;
        }

        // Find the least recently used item
        auto lru_it = std::min_element(
            cache_instance->m_cache.begin(), cache_instance->m_cache.end(), [](const auto& a, const auto& b) {
                return a.second.last_access < b.second.last_access;
            });

        // Perform eviction
        if (lru_it != cache_instance->m_cache.end())
        {
            auto lru_key             = lru_it->first;
            std::size_t evicted_size = lru_it->second.data.use_count() == 1 ? lru_it->second.size : 0;  // TODO size

            // Remove the item from the cache
            cache_instance->m_cache.erase(lru_key);

            // Update the total cached bytes
            m_total_cached_bytes -= evicted_size;
        }
    }

    m_dirty.store(true);
}

std::weak_ptr<uint8_t> CacheManager::store(
    int instance_id, const std::string& uuid, std::shared_ptr<uint8_t> data, std::size_t size, bool pin)
{
    std::lock_guard<std::mutex> lock(m_cache_instances[instance_id]->m_instance_mutex);
    m_dirty.store(true);

    // Update or insert data into cache
    // Create a CacheData object
    CacheManager::CacheInstance::CacheData cache_data;
    cache_data.data        = data;
    cache_data.size        = size;
    cache_data.pinned      = pin;
    cache_data.last_access = std::chrono::high_resolution_clock::now();

    m_cache_instances[instance_id]->m_cache[uuid] = cache_data;

    // Update statistics
    m_cache_instances[instance_id]->m_total_objects_cached++;

    // Handle pinned memory if 'pin' is true
    if (pin)
    {
        m_cache_instances[instance_id]->m_pinned_memory_bytes += size;
    }

    return {data};
}

bool CacheManager::evict(int instance_id, const std::string& uuid)
{
    std::lock_guard<std::mutex> instance_lock(m_cache_instances[instance_id]->m_instance_mutex);
    m_dirty.store(true);

    return m_cache_instances[instance_id]->evict(uuid);
}

std::weak_ptr<uint8_t> CacheManager::get(int instance_id, const std::string& uuid)
{
    std::lock_guard<std::mutex> lock(m_cache_instances[instance_id]->m_instance_mutex);
    m_dirty.store(true);

    auto it = m_cache_instances[instance_id]->m_cache.find(uuid);
    if (it != m_cache_instances[instance_id]->m_cache.end())
    {
        // Cache hit
        it->second.last_access = std::chrono::high_resolution_clock::now();
        m_cache_instances[instance_id]->m_cache_hits++;

        return {it->second.data};
    }
    else
    {
        m_cache_instances[instance_id]->m_cache_misses++;
        return {};
    }
}

void CacheManager::update_global_statistics()
{
    // Temporary holders for global stats
    std::size_t temp_global_cache_instances      = 0;
    std::size_t temp_global_cache_hits           = 0;
    std::size_t temp_global_cache_misses         = 0;
    std::size_t temp_global_pinned_memory_bytes  = 0;
    std::size_t temp_global_total_objects_cached = 0;

    for (std::size_t i = 0; i < m_cache_instances.size(); ++i)
    {
        if (!m_cache_instance_in_use[i]->load())
        {
            continue;
        }
        auto stats = m_cache_instances[i]->get_statistics();

        temp_global_cache_instances += 1;
        temp_global_cache_hits += stats.cache_hits;
        temp_global_cache_misses += stats.cache_misses;
        temp_global_pinned_memory_bytes += stats.pinned_memory_bytes;
        temp_global_total_objects_cached += stats.total_objects_cached;
    }

    // Update the global stats
    m_global_cache_instances.store(temp_global_cache_instances);
    m_global_cache_hits.store(temp_global_cache_hits);
    m_global_cache_misses.store(temp_global_cache_misses);
    m_global_pinned_memory_bytes.store(temp_global_pinned_memory_bytes);
    m_global_total_objects_cached.store(temp_global_total_objects_cached);
}

InstanceStatistics CacheManager::get_instance_statistics(int instance_id)
{
    return m_cache_instances[instance_id]->get_statistics();
}

// TODO(Devin): I need to think about this a bit more; right now, its accurate for all resident CacheInstances, but does
// not maintain a history of evicted instances. I'm mostly convinced this is the correct approach, but its worth
// discussion.
CacheStatistics CacheManager::get_statistics()
{
    if (m_dirty.load())
    {
        update_global_statistics();
        m_dirty.store(false);
    }

    return {m_global_cache_instances.load(),
            m_global_cache_hits.load(),
            m_global_cache_misses.load(),
            m_global_pinned_memory_bytes.load(),
            m_global_total_objects_cached.load()};
}

// CacheInstance Implementation
InstanceStatistics CacheManager::CacheInstance::get_statistics() const
{
    return {m_cache_hits.load(), m_cache_misses.load(), m_pinned_memory_bytes.load(), m_total_objects_cached.load()};
}

bool CacheManager::CacheInstance::evict(const std::string& uuid)
{
    auto it = m_cache.find(uuid);
    if (it == m_cache.end())
    {
        return false;
    }

    m_total_objects_cached--;
    m_total_cached_bytes -= it->second.size;
    if (it->second.pinned)
    {
        m_pinned_memory_bytes -= it->second.size;
    }
    m_cache.erase(it);

    return true;
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

std::weak_ptr<uint8_t> CacheManagerInterface::store(const std::string& uuid,
                                                    std::shared_ptr<uint8_t> data,
                                                    std::size_t size,
                                                    bool pin)
{
    return CacheManager::instance().store(m_instance_id, uuid, data, size, pin);
}

bool CacheManagerInterface::evict(const std::string& uuid)
{
    return CacheManager::instance().evict(m_instance_id, uuid);
}

}  // namespace morpheus::io