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

#include "../../test_utils/common.hpp"  // IWYU pragma: associated

#include "morpheus/io/data_record/memory_record.hpp"

#include <gtest/gtest.h>

#include <thread>
#include <vector>

using namespace morpheus;
using namespace morpheus::test;
using namespace morpheus::io;

class MemoryRecordTest : public ::testing::Test
{
  protected:
    MemoryRecord record;
    uint8_t data[4] = {1, 2, 3, 4};

    void SetUp() override {}

    void TearDown() override {}
};

TEST_F(MemoryRecordTest, CreateRecord)
{
    record.create(data, 4);
    auto read_data = record.read();
    EXPECT_EQ(std::memcmp(read_data.get(), data, 4), 0);
    EXPECT_EQ(record.size_bytes(), 4);
}

TEST_F(MemoryRecordTest, ReadRecord)
{
    record.create(data, 4);
    auto read_data = record.read();
    EXPECT_EQ(std::memcmp(read_data.get(), data, 4), 0);
}

TEST_F(MemoryRecordTest, UpdateRecord)
{
    record.create(data, 4);
    uint8_t new_data[5] = {5, 6, 7, 8, 9};
    record.update(new_data, 5);
    auto read_data = record.read();
    EXPECT_EQ(std::memcmp(read_data.get(), new_data, 5), 0);
    EXPECT_EQ(record.size_bytes(), 5);
}

TEST_F(MemoryRecordTest, RemoveRecord)
{
    record.create(data, 4);
    record.remove();
    auto read_data = record.read();
    EXPECT_EQ(read_data, nullptr);
}

TEST_F(MemoryRecordTest, BackingStoreType)
{
    EXPECT_EQ(record.backing_store(), "System Memory");
}

TEST_F(MemoryRecordTest, TestUUID)
{
    std::string uuid = "some_uuid";
    record.uuid(uuid);
    EXPECT_EQ(record.uuid(), uuid);
}

TEST_F(MemoryRecordTest, TestCacheManagerInterface)
{
    CacheManagerInterface manager;
    record.cache_interface(manager);
    EXPECT_EQ(record.cache_interface().get_instance_id(), manager.get_instance_id());
}