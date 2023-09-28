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

#include "../test_utils/common.hpp"  // IWYU pragma: associated

#include "morpheus/io/cache_manager.hpp"

#include <gtest/gtest.h>

using namespace morpheus;
using namespace morpheus::test;
using namespace morpheus::io;

class CacheManagerTest : public ::testing::Test
{
  protected:
    morpheus::io::CacheManager& cacheManager;

    CacheManagerTest() : cacheManager(morpheus::io::CacheManager::instance()) {}

    virtual void SetUp()
    {
        // Setup code
    }

    virtual void TearDown()
    {
        // Teardown code
    }
};

TEST_F(CacheManagerTest, SingletonTest)
{
    auto& firstInstance  = morpheus::io::CacheManager::instance();
    auto& secondInstance = morpheus::io::CacheManager::instance();
    ASSERT_EQ(&firstInstance, &secondInstance);
}

TEST_F(CacheManagerTest, BasicStoreAndRetrieve)
{
    int instance_id  = cacheManager.allocate_cache_instance();
    std::string uuid = "test_uuid";
    auto shared_data = std::make_shared<uint8_t>(1);
    std::size_t size = sizeof(uint8_t);

    std::weak_ptr<uint8_t> weak_data      = cacheManager.store(instance_id, uuid, shared_data, size, false);
    std::weak_ptr<uint8_t> retrieved_data = cacheManager.get(instance_id, uuid);

    ASSERT_EQ(weak_data.lock().get(), retrieved_data.lock().get());

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, MultipleStoreAndRetrieve)
{
    int instance_id  = cacheManager.allocate_cache_instance();
    std::size_t size = sizeof(uint8_t);

    std::string uuid1 = "uuid1";
    auto shared_data1 = std::make_shared<uint8_t>(42);

    std::string uuid2 = "uuid2";
    auto shared_data2 = std::make_shared<uint8_t>(84);

    cacheManager.store(instance_id, uuid1, shared_data1, size, false);
    cacheManager.store(instance_id, uuid2, shared_data2, size, false);

    ASSERT_EQ(shared_data1.get(), cacheManager.get(instance_id, uuid1).lock().get());
    ASSERT_EQ(shared_data2.get(), cacheManager.get(instance_id, uuid2).lock().get());

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, RetrieveNonExistentObject)
{
    int instance_id  = cacheManager.allocate_cache_instance();
    std::string uuid = "non_existent_uuid";

    std::weak_ptr<uint8_t> retrieved_data = cacheManager.get(instance_id, uuid);
    ASSERT_EQ(nullptr, retrieved_data.lock());

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, CheckCacheHitAndMissStats)
{
    int instance_id  = cacheManager.allocate_cache_instance();
    std::string uuid = "test_uuid";
    auto shared_data = std::make_shared<uint8_t>(42);
    std::size_t size = sizeof(uint8_t);

    cacheManager.get(instance_id, uuid);  // Should be a miss
    cacheManager.store(instance_id, uuid, shared_data, size, false);
    cacheManager.get(instance_id, uuid);  // Should be a hit

    auto stats = cacheManager.get_instance_statistics(instance_id);

    ASSERT_EQ(1, stats.cache_hits);
    ASSERT_EQ(1, stats.cache_misses);

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, CheckPinnedMemory)
{
    int instance_id          = cacheManager.allocate_cache_instance();
    std::string uuid         = "test_uuid";
    auto shared_data         = std::make_shared<uint8_t>(42);
    std::size_t size_of_data = sizeof(uint8_t);

    cacheManager.store(instance_id, uuid, shared_data, size_of_data, true);  // Pinned

    auto stats = cacheManager.get_instance_statistics(instance_id);

    ASSERT_EQ(size_of_data, stats.pinned_memory_bytes);

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, BasicEvict)
{
    int instance_id          = cacheManager.allocate_cache_instance();
    std::string uuid         = "test_uuid";
    auto shared_data         = std::make_shared<uint8_t>(42);
    std::size_t size_of_data = sizeof(uint8_t);

    cacheManager.store(instance_id, uuid, shared_data, size_of_data, false);
    ASSERT_EQ(shared_data.get(), cacheManager.get(instance_id, uuid).lock().get());

    bool evicted = cacheManager.evict(instance_id, uuid);
    ASSERT_TRUE(evicted);

    std::weak_ptr<uint8_t> retrieved_data = cacheManager.get(instance_id, uuid);
    ASSERT_EQ(nullptr, retrieved_data.lock());

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, EvictNonExistentObject)
{
    int instance_id  = cacheManager.allocate_cache_instance();
    std::string uuid = "non_existent_uuid";

    bool evicted = cacheManager.evict(instance_id, uuid);
    ASSERT_FALSE(evicted);

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, ComplexCreateDelete)
{
    int instance_id1 = cacheManager.allocate_cache_instance();
    int instance_id2 = cacheManager.allocate_cache_instance();

    std::string uuid1 = "uuid1";
    auto shared_data1 = std::make_shared<uint8_t>(42);
    std::size_t size1 = sizeof(uint8_t);

    std::string uuid2 = "uuid2";
    auto shared_data2 = std::make_shared<uint8_t>(84);
    std::size_t size2 = sizeof(uint8_t);

    // Store in both instances
    cacheManager.store(instance_id1, uuid1, shared_data1, size1, false);
    cacheManager.store(instance_id2, uuid2, shared_data2, size2, true);

    // Retrieve and validate
    ASSERT_EQ(shared_data1.get(), cacheManager.get(instance_id1, uuid1).lock().get());
    ASSERT_EQ(shared_data2.get(), cacheManager.get(instance_id2, uuid2).lock().get());

    // Evict from instance1
    bool evicted1 = cacheManager.evict(instance_id1, uuid1);
    ASSERT_TRUE(evicted1);

    // Should still exist in instance2
    ASSERT_EQ(shared_data2.get(), cacheManager.get(instance_id2, uuid2).lock().get());

    // Free instances
    cacheManager.free_cache_instance(instance_id1);
    cacheManager.free_cache_instance(instance_id2);
}

// Test to ensure that aggregated statistics are correctly computed
TEST_F(CacheManagerTest, CheckAggregatedStatistics)
{
    int instance_id1 = cacheManager.allocate_cache_instance();
    int instance_id2 = cacheManager.allocate_cache_instance();

    // Populate the cache
    std::string uuid1 = "uuid1";
    auto shared_data1 = std::make_shared<uint8_t>(42);
    cacheManager.store(instance_id1, uuid1, shared_data1, sizeof(uint8_t), true);
    cacheManager.get(instance_id1, uuid1);  // cache hit

    std::string uuid2 = "uuid2";
    auto shared_data2 = std::make_shared<uint8_t>(84);
    cacheManager.store(instance_id2, uuid2, shared_data2, sizeof(uint8_t), true);
    cacheManager.get(instance_id2, uuid2);    // cache hit
    cacheManager.get(instance_id2, "uuid3");  // cache miss

    // Fetch aggregated statistics
    auto aggregated_stats = cacheManager.get_statistics();

    // Verify aggregated stats
    ASSERT_EQ(2, aggregated_stats.cache_hits);
    ASSERT_EQ(1, aggregated_stats.cache_misses);
    ASSERT_EQ(sizeof(uint8_t) * 2, aggregated_stats.pinned_memory_bytes);

    // Clean-up
    cacheManager.free_cache_instance(instance_id1);
    cacheManager.free_cache_instance(instance_id2);
}

// Test to ensure 'dirty' flag works as expected
TEST_F(CacheManagerTest, CheckDirtyFlag)
{
    auto initial_stats = cacheManager.get_statistics();  // Should be all zeros if it's a fresh instance

    int instance_id = cacheManager.allocate_cache_instance();

    std::string uuid = "uuid_dirty";
    auto shared_data = std::make_shared<uint8_t>(2);
    cacheManager.store(instance_id, uuid, shared_data, sizeof(uint8_t), true);
    cacheManager.get(instance_id, uuid);  // cache hit

    // Fetch the statistics after making changes to the cache
    auto new_stats = cacheManager.get_statistics();

    ASSERT_GT(new_stats.cache_hits, initial_stats.cache_hits);
    ASSERT_GT(new_stats.pinned_memory_bytes, initial_stats.pinned_memory_bytes);

    // Clean-up
    cacheManager.free_cache_instance(instance_id);
}

// Test to ensure that evicting an entry affects the aggregate statistics
TEST_F(CacheManagerTest, CheckStatisticsAfterEvict)
{
    int instance_id  = cacheManager.allocate_cache_instance();
    std::string uuid = "uuid_evict";
    auto shared_data = std::make_shared<uint8_t>(50);
    cacheManager.store(instance_id, uuid, shared_data, sizeof(uint8_t), true);

    // Check initial statistics
    auto initial_stats = cacheManager.get_statistics();
    ASSERT_EQ(sizeof(uint8_t), initial_stats.pinned_memory_bytes);

    // Evict an entry and check statistics again
    cacheManager.evict(instance_id, uuid);
    auto post_evict_stats = cacheManager.get_statistics();

    ASSERT_EQ(0, post_evict_stats.pinned_memory_bytes);

    // Clean-up
    cacheManager.free_cache_instance(instance_id);
}

// Test to ensure the statistics correctly handle multiple instances with mixed pinned and unpinned data
TEST_F(CacheManagerTest, CheckMixedPinnedUnpinnedStatistics)
{
    int instance_id1 = cacheManager.allocate_cache_instance();
    int instance_id2 = cacheManager.allocate_cache_instance();

    // Instance 1: Pinned data
    std::string uuid1 = "uuid1";
    auto shared_data1 = std::make_shared<uint8_t>(25);
    cacheManager.store(instance_id1, uuid1, shared_data1, sizeof(uint8_t), true);

    // Instance 2: Unpinned data
    std::string uuid2 = "uuid2";
    auto shared_data2 = std::make_shared<uint8_t>(30);
    cacheManager.store(instance_id2, uuid2, shared_data2, sizeof(uint8_t), false);

    auto mixed_stats = cacheManager.get_statistics();

    ASSERT_EQ(0, mixed_stats.cache_hits);                         // No cache hits yet
    ASSERT_EQ(0, mixed_stats.cache_misses);                       // No cache misses yet
    ASSERT_EQ(sizeof(uint8_t), mixed_stats.pinned_memory_bytes);  // Only uuid1 should contribute

    // Clean-up
    cacheManager.free_cache_instance(instance_id1);
    cacheManager.free_cache_instance(instance_id2);
}

// Test to simulate complex create and delete scenarios, and check if stats are still correct
TEST_F(CacheManagerTest, ComplexCreateEvict)
{
    int instance_id = cacheManager.allocate_cache_instance();

    // Insert, access, and remove multiple entries
    for (int i = 1; i <= 10; ++i)
    {
        std::string uuid = "uuid" + std::to_string(i);
        auto shared_data = std::make_shared<uint8_t>(i);
        cacheManager.store(instance_id, uuid, shared_data, sizeof(uint8_t), (i % 2 == 0));  // Pin even entries
        cacheManager.get(instance_id, uuid);                                                // Increment cache hits
    }

    auto stats_1 = cacheManager.get_statistics();
    ASSERT_EQ(1, stats_1.cache_instances);
    ASSERT_EQ(10, stats_1.total_objects_cached);
    ASSERT_EQ(10, stats_1.cache_hits);
    ASSERT_EQ(5 * sizeof(uint8_t), stats_1.pinned_memory_bytes);  // Only 5 pinned entries should be left

    // Evict half the entries
    for (int i = 1; i <= 5; ++i)
    {
        std::string uuid = "uuid" + std::to_string(i);
        cacheManager.evict(instance_id, uuid);
    }

    // Fetch statistics and validate
    auto stats_2 = cacheManager.get_statistics();
    ASSERT_EQ(10, stats_2.cache_hits);
    ASSERT_EQ(1, stats_2.cache_instances);
    ASSERT_EQ(5, stats_2.total_objects_cached);

    // 2, and 4 above will be pinned memory that is evicted, leaving 3 pinned objects
    ASSERT_EQ(3 * sizeof(uint8_t), stats_2.pinned_memory_bytes);  // Only 3 pinned entries should be left

    // Clean-up
    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, MaxCachedObjects)
{
    cacheManager.set_max_cached_objects(5);
    ASSERT_EQ(5, cacheManager.get_max_cached_objects());
}

TEST_F(CacheManagerTest, MaxCachedBytes)
{
    cacheManager.set_max_cached_bytes(1024);
    ASSERT_EQ(1024, cacheManager.get_max_cached_bytes());
}

TEST_F(CacheManagerTest, MemoryUtilizationThreshold)
{
    cacheManager.set_memory_utilization_threshold(0.75);
    ASSERT_DOUBLE_EQ(0.75, cacheManager.get_memory_utilization_threshold());
}