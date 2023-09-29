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

class CacheManagerInterfaceTest : public ::testing::Test
{
  protected:
    CacheManagerInterface m_cacheInterface;
};

TEST_F(CacheManagerInterfaceTest, GetInstanceID)
{
    int expected_instance_id = 0;
    EXPECT_EQ(m_cacheInterface.get_instance_id(), expected_instance_id);
}

// Test case for storing and getting an object
TEST_F(CacheManagerInterfaceTest, StoreAndGet)
{
    std::string uuid = "test_uuid";
    std::shared_ptr<uint8_t> data(new uint8_t[10], std::default_delete<uint8_t[]>());
    m_cacheInterface.store(uuid, data, 10);

    auto retrieved_data = m_cacheInterface.get(uuid);
    EXPECT_NE(retrieved_data.lock(), nullptr);
}

// Test case for evicting an object
TEST_F(CacheManagerInterfaceTest, Evict)
{
    std::string uuid = "test_uuid_evict";
    std::shared_ptr<uint8_t> data(new uint8_t[10], std::default_delete<uint8_t[]>());
    m_cacheInterface.store(uuid, data, 10);

    EXPECT_TRUE(m_cacheInterface.evict(uuid));
    auto retrieved_data = m_cacheInterface.get(uuid);
    EXPECT_EQ(retrieved_data.lock(), nullptr);
}

// Test case for handling pinned objects
TEST_F(CacheManagerInterfaceTest, HandlePinnedObjects)
{
    std::string uuid = "test_uuid_pin";
    std::shared_ptr<uint8_t> data(new uint8_t[10], std::default_delete<uint8_t[]>());
    m_cacheInterface.store(uuid, data, 10, true);  // Pin the object

    // Verify the pinned object is still in cache
    auto retrieved_data = m_cacheInterface.get(uuid);
    EXPECT_NE(retrieved_data.lock(), nullptr);
}

// Test case for retrieving cache statistics
TEST_F(CacheManagerInterfaceTest, GetStatistics)
{
    std::string uuid1 = "test_uuid_stat1";
    std::string uuid2 = "test_uuid_stat2";
    std::shared_ptr<uint8_t> data1(new uint8_t[10], std::default_delete<uint8_t[]>());
    std::shared_ptr<uint8_t> data2(new uint8_t[20], std::default_delete<uint8_t[]>());

    m_cacheInterface.store(uuid1, data1, 10);
    m_cacheInterface.store(uuid2, data2, 20);

    InstanceStatistics stats = m_cacheInterface.get_statistics();
    EXPECT_EQ(stats.total_cached_objects, 2);
    EXPECT_EQ(stats.total_cached_bytes, 30);
}
