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

using namespace boost::multi_index;

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
    m_max_cached_objects.store(max);
}

void CacheManager::set_max_cached_bytes(std::size_t max)
{
    m_max_cached_bytes.store(max);
}

void CacheManager::set_memory_utilization_threshold(double percentage)
{
    m_memory_utilization_threshold.store(percentage);
}

std::size_t CacheManager::get_max_cached_objects() const
{
    return m_max_cached_objects.load();
}

std::size_t CacheManager::get_max_cached_bytes() const
{
    return m_max_cached_bytes.load();
}

double CacheManager::get_memory_utilization_threshold() const
{
    return m_memory_utilization_threshold.load();
}

int CacheManager::allocate_cache_instance()
{
    std::scoped_lock<std::mutex> lock(m_cache_creation_mutex);

    int instance_id = -1;

    // Search for an available cache instance slot
    for (std::size_t i = 0; i < m_cache_instance_in_use.size(); ++i)
    {
        if (!m_cache_instance_in_use[i])
        {
            m_cache_instance_in_use[i]->store(true);  // Mark the instance as in use
            instance_id = static_cast<int>(i);        // Return the instance index
        }
    }

    // If no available slot, create a new unique_ptr to a CacheInstance
    if (instance_id < 0)
    {
        auto instance = std::make_unique<CacheInstance>();
        m_cache_instances.push_back(std::move(instance));

        // Mark the new instance as in use
        auto new_instance_index = std::make_unique<std::atomic<bool>>(true);
        m_cache_instance_in_use.push_back(std::move(new_instance_index));

        // Return the index of the new instance
        instance_id = static_cast<int>(m_cache_instances.size() - 1);
    }

    m_global_cache_instances += 1;

    return instance_id;
}

void CacheManager::free_cache_instance(int instance_id)
{
    check_is_instance_valid(instance_id);

    // Reset instance properties and statistics
    m_cache_instances[instance_id]->reset();

    // Mark the instance as no longer in use
    m_cache_instance_in_use[instance_id]->store(false);
    m_global_cache_instances -= 1;
    m_dirty.store(true);
}

void CacheManager::lru_evict() {}
bool exceeds_limits(std::size_t iid)
{  // TODO(Devin)
    return false;
}

std::weak_ptr<uint8_t> CacheManager::store(
    int instance_id, const std::string& uuid, std::shared_ptr<uint8_t> data, std::size_t size, bool pin)
{
    check_is_instance_valid(instance_id);

    // Check if cache limits would be exceeded, and evict if necessary
    while (exceeds_limits(instance_id)) // TODO
    {
        m_cache_instances[instance_id]->lru_evict();
    }

    // Create and insert new CacheData
    CacheInstance::CacheData cache_data = {uuid, pin, data, size, std::chrono::high_resolution_clock::now()};

    // Scoped block
    {
        std::scoped_lock<std::mutex> lock(m_cache_instances[instance_id]->m_instance_mutex);
        auto insert_result = m_cache_instances[instance_id]->m_cache.insert(cache_data);

        if (!insert_result.second)
        {
            std::string error_string = "Data insertion failed. UUID might already exist.";
            LOG(ERROR) << error_string;

            throw std::runtime_error(error_string);
        }
    }

    // Update statistics
    m_cache_instances[instance_id]->m_total_objects_cached.fetch_add(1, std::memory_order_relaxed);
    m_cache_instances[instance_id]->m_total_cached_bytes.fetch_add(size, std::memory_order_relaxed);

    if (pin)
    {
        m_cache_instances[instance_id]->m_pinned_memory_bytes.fetch_add(size, std::memory_order_relaxed);
    }

    return {data};
}

bool CacheManager::evict(int instance_id, const std::string& uuid)
{
    // Validate the instance ID
    if (instance_id < 0 || instance_id >= m_cache_instances.size())
    {
        LOG(ERROR) << "Invalid instance ID.";
        return false;
    }

    auto result = m_cache_instances[instance_id]->evict(uuid);
    m_dirty.store(true);

    return result;
}

std::weak_ptr<uint8_t> CacheManager::get(int instance_id, const std::string& uuid)
{
    // Acquire lock for the specific instance
    std::scoped_lock<std::mutex> lock(m_cache_instances[instance_id]->m_instance_mutex);
    m_dirty.store(true);

    auto& cache_index = m_cache_instances[instance_id]->m_cache.get<0>();  // The hashed index
    auto it           = cache_index.find(uuid);

    if (it != cache_index.end())
    {
        // Cache hit
        m_cache_instances[instance_id]->m_cache_hits.fetch_add(1, std::memory_order_relaxed);
        return {it->data};
    }
    else
    {
        // Cache miss
        m_cache_instances[instance_id]->m_cache_misses.fetch_add(1, std::memory_order_relaxed);
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

void CacheManager::check_is_instance_valid(int instance_id) const
{
    // Validate the instance ID
    if (instance_id < 0 || instance_id >= m_cache_instances.size())
    {
        std::string error_string = "Invalid instance ID.";
        LOG(ERROR) << error_string;

        throw std::runtime_error(error_string);
    }
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
bool CacheInstance::evict(const std::string& uuid)
{
    std::scoped_lock<std::mutex> lock(m_instance_mutex);

    auto& index = m_cache.get<0>();
    auto it     = index.find(uuid);

    if (it != index.end())
    {
        std::size_t size = it->size;

        m_total_objects_cached.fetch_sub(1);
        m_total_cached_bytes.fetch_sub(size);

        if (it->pinned)
        {
            m_pinned_memory_bytes.fetch_sub(size);
        }

        index.erase(it);

        return true;
    }

    return false;
}

bool CacheInstance::lru_evict()
{
    auto& index = m_cache.get<1>();  // The ordered index
    auto it     = index.begin();     // The least recently accessed item

    if (it != index.end())
    {
        if (!it->pinned)
        {
            std::size_t size = it->size;
            index.erase(it);

            // Update statistics
            m_total_objects_cached.fetch_sub(1, std::memory_order_relaxed);
            m_total_cached_bytes.fetch_sub(size, std::memory_order_relaxed);

            return true;
        }
        else
        {
            LOG(WARNING) << "Attempt to evict pinned item.";
        }
    }
    return false;
}

void CacheInstance::reset()
{
    // Acquire lock to ensure no other operations interfere with the reset
    std::scoped_lock<std::mutex> lock(m_instance_mutex);

    // Clear the multi-index cache
    m_cache.clear();

    // Reset statistics
    m_cache_hits.store(0, std::memory_order_relaxed);
    m_cache_misses.store(0, std::memory_order_relaxed);
    m_total_cached_bytes.store(0, std::memory_order_relaxed);
    m_pinned_memory_bytes.store(0, std::memory_order_relaxed);
    m_total_objects_cached.store(0, std::memory_order_relaxed);
}

InstanceStatistics CacheInstance::get_statistics() const
{
    return {m_cache_hits.load(), m_cache_misses.load(), m_pinned_memory_bytes.load(), m_total_objects_cached.load()};
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