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

#include <boost/multi_index/hashed_index.hpp>
#include <boost/multi_index/member.hpp>
#include <boost/multi_index/ordered_index.hpp>
#include <boost/multi_index_container.hpp>

#include <atomic>
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>

namespace morpheus::io {
#pragma GCC visibility push(default)
struct InstanceStatistics
{
    std::size_t cache_hits;
    std::size_t cache_misses;
    std::size_t pinned_memory_bytes;
    std::size_t total_cached_bytes;
    std::size_t total_cached_objects;
    std::size_t cache_evictions;
};

struct CacheStatistics
{
    std::size_t cache_instances;
    std::size_t cache_hits;
    std::size_t cache_misses;
    std::size_t pinned_memory_bytes;
    std::size_t total_cached_bytes;
    std::size_t total_cached_objects;
    std::size_t cache_evictions;
};

class CacheInstance;

// TODO(Devin): I think this should be all static, refactor when time permits.
// TODO(Devin): Add 'reset' method to reset all statistics and clear all caches.
/**
 * @brief CacheManager class is responsible for managing all caching operations and policies.
 *
 * This class is designed as a singleton and it orchestrates cache instances, eviction policies,
 * and global cache settings. It also maintains information about total cached bytes.
 */
class CacheManager
{
  public:
    /**
     * @brief Provides singleton access to the CacheManager.
     *
     * @return Reference to the singleton CacheManager object.
     */
    static CacheManager& instance();

    // Disable copy constructor and copy assignment operator.
    CacheManager(const CacheManager&)            = delete;
    CacheManager& operator=(const CacheManager&) = delete;

    /**
     * @brief Store data into a specific cache instance.
     *
     * This method takes an instance ID and UUID to associate the data with a particular
     * cache instance managed by the CacheManager. Additionally, you can specify
     * whether the data should be pinned in memory and the size of the data.
     *
     * @param instance_id : ID of the cache instance.
     * @param uuid : The unique identifier for the data.
     * @param data : shared_ptr to the data to be stored.
     * @param size : The size of the data to be cached.
     * @param pin : Whether the data should be pinned in memory. Default is false.
     * @return std::weak_ptr to the stored data.
     */
    std::weak_ptr<uint8_t> store(
        int instance_id, const std::string& uuid, std::shared_ptr<uint8_t> data, std::size_t size, bool pin = false);

    /**
     * @brief Evict an object from the cache based on its UUID.
     * @note Attempting to remove something that doesn't exist is not an error, which is why we have a return value
     * here.
     *
     * @param instance_id ID of the cache instance.
     * @param uuid UUID of the object to remove.
     * @return true if the object was successfully removed, false otherwise.
     */
    bool evict(int instance_id, const std::string& uuid);

    /**
     * @brief Retrieve data from a specific cache instance.
     *
     * This method takes an instance ID and UUID to retrieve data associated with a
     * particular cache instance managed by the CacheManager.
     *
     * @param instance_id : ID of the cache instance.
     * @param uuid : The unique identifier for the data.
     * @return std::weak_ptr to the data.
     */
    std::weak_ptr<uint8_t> get(int instance_id, const std::string& uuid);

    /**
     * @brief Sets the maximum number of cached objects.
     *
     * @param max : The maximum number of objects that can be cached.
     */
    void set_max_cached_objects(std::size_t max);

    /**
     * @brief Sets the maximum amount of memory that can be used for caching, in bytes.
     *
     * @param max : The maximum amount of memory in bytes.
     */
    void set_max_cached_bytes(std::size_t max);

    /**
     * @brief Sets the memory utilization threshold as a percentage of system memory.
     *
     * When this threshold is reached, eviction policies will be triggered.
     *
     * @param percentage : The utilization threshold as a percentage.
     */
    void set_memory_utilization_threshold(double percentage);

    /**
     * @brief Gets the maximum number of cached objects.
     *
     * @return The maximum number of cached objects.
     */
    std::size_t get_max_cached_objects() const;

    /**
     * @brief Gets the maximum amount of memory used for caching, in bytes.
     *
     * @return The maximum amount of memory in bytes.
     */
    std::size_t get_max_cached_bytes() const;

    /**
     * @brief Gets the memory utilization threshold as a percentage of system memory.
     *
     * @return The memory utilization threshold.
     */
    double get_memory_utilization_threshold() const;

    InstanceStatistics get_instance_statistics(int instance_id);

    /**
     * Get aggregated statistics across all active cache instances.
     * @note To avoid excessive locking, statistics are accumulated incrementally and may be slightly stale.
     *
     * @return CacheStatistics, aggregated stats of all instances
     */
    CacheStatistics get_statistics();

    // Method to check if the cache has exceeded its limits

    // Returns true if any of the limitations (e.g., max_objects, max_bytes, system_memory_threshold) are exceeded
    // Otherwise, returns false.
    bool caching_threshold_exceeded(std::size_t incoming_object_size);

    // Methods to manage CacheInstance allocation
    // Allocate a new CacheInstance and return its unique instance ID.
    // This function dynamically creates a CacheInstance, assigns a unique instance ID to it,
    // and saves it in a pool of cache instances for future retrieval.
    //
    // Returns:
    //   - A unique identifier (instance ID) for the newly allocated CacheInstance.
    //   - A negative value if allocation fails, for example, due to resource limits.
    int allocate_cache_instance();

    // Free an existing CacheInstance given its unique instance ID.
    // This function marks the CacheInstance as no longer in use, effectively releasing its resources,
    // and removes it from the pool of active cache instances. It may also reset the CacheInstance's
    // internal state, such as stored cache items and statistics, depending on implementation.
    //
    // Parameters:
    //   - instance_id: The unique identifier of the CacheInstance to be freed.
    //
    // Returns:
    //   - No return value.
    //   - May log an error or throw an exception if the instance ID is invalid or the CacheInstance
    //     could not be freed.
    void free_cache_instance(int instance_id);

  private:
    /**
     * @brief Private constructor to enforce the Singleton pattern.
     */
    CacheManager();

    std::vector<std::unique_ptr<CacheInstance>> m_cache_instances;  // Vector holding all cache instances
    std::vector<std::unique_ptr<std::atomic_bool>>
        m_cache_instance_in_use;  // Vector indicating which instances are in use

    // Configuration settings
    std::atomic<double> m_memory_utilization_threshold;
    std::atomic<std::size_t> m_max_cached_objects;
    std::atomic<std::size_t> m_max_cached_bytes;

    // Global statistics
    std::size_t m_total_cached_bytes;
    std::atomic<std::size_t> m_global_cache_instances{0};
    std::atomic<std::size_t> m_global_cache_hits{0};
    std::atomic<std::size_t> m_global_cache_misses{0};
    std::atomic<std::size_t> m_global_pinned_memory_bytes{0};
    std::atomic<std::size_t> m_global_cached_bytes{0};
    std::atomic<std::size_t> m_global_total_objects_cached{0};

    // Mutex for ensuring thread safety during global operations
    mutable std::recursive_mutex m_cache_creation_mutex;
    mutable std::mutex m_statistics_mutex;
    mutable std::mutex m_global_mutex;

    /**
     * Flag that indicates whether the cache statistics are stale and need to be updated.
     */
    std::atomic<bool> m_dirty{false};

    // LRU eviction logic
    void lru_evict();

    void update_global_statistics();
    void check_is_instance_valid(int instance_id) const;
};

class CacheInstance
{
  public:
    struct CacheData
    {
        std::string uuid;  // Unique identifier
        bool pinned;

        std::shared_ptr<uint8_t> data;
        std::size_t size;
        std::chrono::time_point<std::chrono::high_resolution_clock> last_access;
    };

    using cache_container_t = boost::multi_index_container<
        CacheData,
        boost::multi_index::indexed_by<
            boost::multi_index::hashed_unique<boost::multi_index::member<CacheData, std::string, &CacheData::uuid>>,
            boost::multi_index::ordered_non_unique<
                boost::multi_index::member<CacheData,
                                           std::chrono::time_point<std::chrono::high_resolution_clock>,
                                           &CacheData::last_access>>>>;

    std::recursive_mutex m_cache_mutex;
    cache_container_t m_cache;

    // Statistics for this CacheInstance
    std::atomic<std::size_t> m_cache_hits{0};
    std::atomic<std::size_t> m_cache_misses{0};
    std::atomic<std::size_t> m_total_cached_bytes{0};
    std::atomic<std::size_t> m_pinned_memory_bytes{0};
    std::atomic<std::size_t> m_total_objects_cached{0};

    // Assuming InstanceStatistics is a type you've defined
    InstanceStatistics get_statistics() const;

    bool lru_evict();
    bool evict(const std::string& uuid);
    void reset();
};

/**
 * @brief CacheManagerInterface class provides an interface to interact with a specific cache instance.
 *
 * Each CacheManagerInterface has a unique cache instance ID which it uses to interact
 * with the main CacheManager.
 */
class CacheManagerInterface
{
  public:
    /**
     * @brief Constructor that initializes and allocates a cache instance.
     */
    CacheManagerInterface();

    /**
     * @brief Copy constructor.
     *
     * Creates a new CacheManagerInterface as a copy of an existing instance.
     * The new object will interact with the same cache instance as the original.
     *
     * @param other The CacheManagerInterface object to copy from.
     */
    CacheManagerInterface(const CacheManagerInterface& other) = default;

    /**
     * @brief Destructor that frees the allocated cache instance.
     */
    ~CacheManagerInterface();

    /**
     * @brief Retrieves a weak pointer to the data associated with the given UUID.
     *
     * @param uuid : The unique identifier for the data.
     * @return std::weak_ptr to the data.
     */
    std::weak_ptr<uint8_t> get(const std::string& uuid);

    /**
     * @brief Stores an object in the cache associated with a given UUID.
     *
     * This method takes a shared pointer to the data object and a UUID string.
     * It stores the object in the cache and returns a weak pointer to it,
     * allowing temporary, non-owning access to the stored object.
     *
     * @param uuid : The universally unique identifier for the object.
     * @param data : Shared pointer to the object to be stored.
     * @param size : The size of the data to be cached.
     * @param pin : Whether the data should be pinned in memory. Default is false.
     * @return std::weak_ptr<uint8_t> : Weak pointer to the stored object.
     */
    std::weak_ptr<uint8_t> store(const std::string& uuid,
                                 std::shared_ptr<uint8_t> data,
                                 std::size_t size,
                                 bool pin = false);

    /**
     * @brief Evict an object from the cache based on its UUID.
     *
     * @param uuid UUID of the object to remove.
     * @return true if the object was successfully removed, false otherwise.
     */
    bool evict(const std::string& uuid);

    /**
     * @brief Retrieves the unique ID of the cache instance this interface operates on.
     *
     * This method returns the unique identifier (ID) for the cache instance managed
     * by this CacheManagerInterface. The instance ID is used to interact with the
     * underlying CacheManager.
     *
     * @return int : The unique ID of the associated cache instance.
     */
    int get_instance_id() const;

    /**
     * @brief Retrieves various statistics associated with this cache instance.
     *
     * This function returns a structure (or a tuple, dictionary, etc. depending on your
     * choice of language features) that holds statistical information about this cache instance,
     * such as the total number of objects, total bytes, pinned bytes, and so on.
     *
     * @return A structure containing statistical information.
     */
    InstanceStatistics get_statistics();

  private:
    int m_instance_id;  // The ID of the cache instance this interface operates on
};
#pragma GCC visibility pop
}  // namespace morpheus::io
