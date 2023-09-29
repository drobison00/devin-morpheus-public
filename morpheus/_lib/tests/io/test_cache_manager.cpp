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

#include <thread>
#include <vector>

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
    ASSERT_EQ(10, stats_1.total_cached_objects);
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
    ASSERT_EQ(5, stats_2.total_cached_objects);

    // 2, and 4 above will be pinned memory that is evicted, leaving 3 pinned objects
    ASSERT_EQ(3 * sizeof(uint8_t), stats_2.pinned_memory_bytes);  // Only 3 pinned entries should be left

    // Clean-up
    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestLRUEvictionWhenFull)
{
    int instance_id = cacheManager.allocate_cache_instance();

    // Fill the cache to its limit
    auto MAX_CACHE_SIZE = 10;
    cacheManager.set_max_cached_bytes(MAX_CACHE_SIZE * 100);

    for (int i = 0; i < MAX_CACHE_SIZE; ++i)
    {  // Assume MAX_CACHE_SIZE is the limit
        std::string uuid = "UUID_" + std::to_string(i);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, false);
    }

    // Insert an additional item; this should trigger eviction
    std::string additional_uuid = "UUID_ADDITIONAL";
    std::shared_ptr<uint8_t> additional_data(new uint8_t[100], std::default_delete<uint8_t[]>());
    cacheManager.store(instance_id, additional_uuid, additional_data, 100, false);

    // Verify that the first inserted item has been evicted
    auto evicted_data = cacheManager.get(instance_id, "UUID_0");  // Assume `retrieve` is a function you have
    EXPECT_EQ(evicted_data.lock(), nullptr);

    // Verify that the additional item exists
    auto added_data = cacheManager.get(instance_id, additional_uuid);
    EXPECT_NE(added_data.lock(), nullptr);

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestLRUEvictionWithPinnedItems)
{
    int instance_id = cacheManager.allocate_cache_instance();

    // Fill the cache to its limit with pinned items
    auto MAX_CACHE_SIZE = 10;
    cacheManager.set_max_cached_bytes(MAX_CACHE_SIZE * 100);

    for (int i = 0; i < MAX_CACHE_SIZE - 1; ++i)
    {
        std::string uuid = "UUID_PIN_" + std::to_string(i);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, true);  // Pinning the item
    }

    // Insert an additional unpinned item; this should NOT trigger eviction of pinned items
    std::string additional_uuid = "UUID_ADDITIONAL";
    std::shared_ptr<uint8_t> additional_data(new uint8_t[100], std::default_delete<uint8_t[]>());
    cacheManager.store(instance_id, additional_uuid, additional_data, 100, false);

    // Verify that the first inserted pinned item still exists
    auto pinned_data = cacheManager.get(instance_id, "UUID_PIN_0");
    EXPECT_NE(pinned_data.lock(), nullptr);

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestLRUEvictionWhenHalfFull)
{
    int instance_id = cacheManager.allocate_cache_instance();

    // Fill the cache to its half limit
    auto MAX_CACHE_SIZE = 10;
    cacheManager.set_max_cached_bytes(MAX_CACHE_SIZE * 100);

    for (int i = 0; i < MAX_CACHE_SIZE / 2; ++i)
    {
        std::string uuid = "UUID_" + std::to_string(i);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, false);
    }

    // Insert an additional item; this should NOT trigger eviction
    std::string additional_uuid = "UUID_ADDITIONAL";
    std::shared_ptr<uint8_t> additional_data(new uint8_t[100], std::default_delete<uint8_t[]>());
    cacheManager.store(instance_id, additional_uuid, additional_data, 100, false);

    // Verify that the first inserted item still exists
    auto initial_data = cacheManager.get(instance_id, "UUID_0");
    EXPECT_NE(initial_data.lock(), nullptr);

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestLRUEvictionByMaxBytesAndMaxObjects)
{
    int instance_id = cacheManager.allocate_cache_instance();

    // Set maximum limits for cache
    auto MAX_CACHE_SIZE  = 10;   // maximum objects
    auto MAX_CACHE_BYTES = 900;  // maximum bytes
    cacheManager.set_max_cached_bytes(MAX_CACHE_BYTES);
    cacheManager.set_max_cached_objects(MAX_CACHE_SIZE);

    // Fill the cache to its limit
    for (int i = 0; i < MAX_CACHE_SIZE; ++i)
    {
        std::string uuid = "UUID_" + std::to_string(i);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, false);
    }

    // Insert an additional item; this should trigger eviction
    std::string additional_uuid = "UUID_ADDITIONAL";
    std::shared_ptr<uint8_t> additional_data(new uint8_t[50], std::default_delete<uint8_t[]>());
    cacheManager.store(instance_id, additional_uuid, additional_data, 50, false);

    // Verify that the first inserted item has been evicted
    auto evicted_data = cacheManager.get(instance_id, "UUID_0");
    EXPECT_EQ(evicted_data.lock(), nullptr);
    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestLRUEvictionByMaxBytesWhenMaxObjectsUnset)
{
    int instance_id = cacheManager.allocate_cache_instance();

    // Set maximum limit for bytes only
    auto MAX_CACHE_BYTES = 900;  // maximum bytes
    cacheManager.set_max_cached_bytes(MAX_CACHE_BYTES);

    // Fill the cache to nearly its byte limit
    for (int i = 0; i < 9; ++i)  // 900 bytes, 9 objects
    {
        std::string uuid = "UUID_" + std::to_string(i);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, false);
    }

    // Insert an additional item; this should trigger eviction by bytes
    std::string additional_uuid = "UUID_ADDITIONAL";
    std::shared_ptr<uint8_t> additional_data(new uint8_t[50], std::default_delete<uint8_t[]>());
    cacheManager.store(instance_id, additional_uuid, additional_data, 50, false);

    // Verify that the first inserted item has been evicted
    auto evicted_data = cacheManager.get(instance_id, "UUID_0");
    EXPECT_EQ(evicted_data.lock(), nullptr);
    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestConcurrentStoreAndGet)
{
    int instance_id           = cacheManager.allocate_cache_instance();
    constexpr int NUM_THREADS = 100;
    std::vector<std::thread> threads;

    auto worker = [&](int idx) {
        std::string uuid = "UUID_" + std::to_string(idx);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, false);
        auto retrieved_data = cacheManager.get(instance_id, uuid);
        EXPECT_EQ(retrieved_data.lock(), data);
    };

    for (int i = 0; i < NUM_THREADS; ++i)
    {
        threads.push_back(std::thread(worker, i));
    }

    for (auto& t : threads)
    {
        t.join();
    }

    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestConcurrentStoreWithLRUEviction)
{
    constexpr int NumThreads  = 100;
    constexpr int PayloadSize = 100;
    int instance_id           = cacheManager.allocate_cache_instance();
    cacheManager.set_max_cached_bytes((NumThreads / 2) * PayloadSize);
    cacheManager.set_max_cached_objects(NumThreads / 2);

    std::vector<std::thread> threads;

    auto worker = [&](int idx) {
        std::string uuid = "UUID_" + std::to_string(idx);
        std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
        cacheManager.store(instance_id, uuid, data, 100, false);
    };

    for (int i = 0; i < NumThreads; ++i)
    {
        threads.push_back(std::thread(worker, i));
    }

    for (auto& t : threads)
    {
        t.join();
    }

    auto stats = cacheManager.get_statistics();
    // Validate that the total cached bytes do not exceed the limit
    EXPECT_LE(stats.total_cached_bytes, (NumThreads / 2) * PayloadSize);

    // Validate that the total cached objects do not exceed the limit
    EXPECT_LE(stats.total_cached_objects, NumThreads / 2);
    cacheManager.free_cache_instance(instance_id);
}

TEST_F(CacheManagerTest, TestConcurrentStoreWithPinnedAndUnpinned)
{
    int instance_id = cacheManager.allocate_cache_instance();
    cacheManager.set_max_cached_bytes(600);  // Total bytes shouldn't exceed 600
    cacheManager.set_max_cached_objects(6);  // Total objects shouldn't exceed 6

    constexpr int NUM_THREADS = 12;
    std::vector<std::thread> threads;
    std::atomic<int> exceptions_counter = 0;

    auto worker = [&](int idx) {
        try {
            std::string uuid = "UUID_" + std::to_string(idx);
            std::shared_ptr<uint8_t> data(new uint8_t[100], std::default_delete<uint8_t[]>());
            bool pin = idx % 2 == 0;  // Pin even-numbered items
            cacheManager.store(instance_id, uuid, data, 100, pin);
        } catch (const std::runtime_error& e) {
            exceptions_counter++;
        }
    };

    for (int i = 0; i < NUM_THREADS; ++i) {
        threads.push_back(std::thread(worker, i));
    }

    for (auto& t : threads) {
        t.join();
    }

    auto stats = cacheManager.get_statistics();
    // Validate that the total cached bytes do not exceed the limit
    EXPECT_LE(stats.total_cached_bytes, 600);

    // Validate that the total cached objects do not exceed the limit
    EXPECT_LE(stats.total_cached_objects, 6);

    // Validate that at least one exception was thrown due to exceeding limits
    EXPECT_GT(exceptions_counter.load(), 0);
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