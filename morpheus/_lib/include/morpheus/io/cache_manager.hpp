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

#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>

namespace morpheus::io {
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
     * cache instance managed by the CacheManager.
     *
     * @param instance_id : ID of the cache instance.
     * @param uuid : The unique identifier for the data.
     * @param data : shared_ptr to the data to be stored.
     */
    void store(int instance_id, const std::string& uuid, std::shared_ptr<uint8_t> data);

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

    // Methods to manage CacheInstance allocation
    int allocate_cache_instance();
    void free_cache_instance(int instance_id);

  private:
    /**
     * @brief Private constructor to enforce the Singleton pattern.
     */
    CacheManager();

    /**
     * @brief Internal struct representing a cache instance.
     *
     * This struct holds the actual cache as an unordered_map.
     */
    struct CacheInstance
    {
        struct CacheData
        {
            std::shared_ptr<uint8_t> data;
            std::size_t size;
            std::chrono::steady_clock::time_point last_access;
        };

        std::unordered_map<std::string, CacheData> m_cache;
        std::unique_ptr<std::mutex> m_instance_mutex;
    };

    std::vector<CacheInstance> m_cache_instances;  // Vector holding all cache instances
    std::vector<bool> m_cache_instance_in_use;     // Vector indicating which instances are in use

    // Configuration settings
    std::size_t m_max_cached_objects;
    std::size_t m_max_cached_bytes;
    double m_memory_utilization_threshold;

    // Global count of cached bytes
    std::size_t m_total_cached_bytes;

    // Mutex for ensuring thread safety during global operations
    mutable std::mutex m_global_mutex;

    // LRU eviction logic
    void lru_evict();
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
     * @brief Stores data associated with a UUID in the cache.
     *
     * @param uuid : The unique identifier for the data.
     * @param data : shared_ptr to the data to be stored.
     */
    void store(const std::string& uuid, std::shared_ptr<uint8_t> data);

  private:
    int m_instance_id;  // The ID of the cache instance this interface operates on
};

}  // namespace morpheus::io
