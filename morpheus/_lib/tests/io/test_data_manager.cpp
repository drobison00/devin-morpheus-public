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
#include "test_io.hpp"

#include "morpheus/io/data_manager.hpp"

#include <gtest/gtest.h>

#include <thread>

using namespace morpheus;
using namespace morpheus::test;
using namespace morpheus::io;

class DataManagerParameterizedTypeTest : public ::testing::TestWithParam<data_record_type>
{};

TEST_F(DataManagerTest, ConcurrentCreate)
{
    DataManager manager;
    uint8_t bytes[3]      = {1, 2, 3};
    const int num_threads = 10;

    auto create_record = [&]() {
        for (int i = 0; i < 100; ++i)
        {
            ASSERT_NO_THROW({ std::string uuid = manager.create(data_record_type::memory, bytes, 3); });
        }
    };

    std::vector<std::thread> threads;
    for (int i = 0; i < num_threads; ++i)
    {
        threads.emplace_back(create_record);
    }

    for (auto& t : threads)
    {
        t.join();
    }
}

TEST_F(DataManagerTest, CreateRecordFailureWithMemoryType)
{
    DataManager manager;
    auto type = data_record_type::memory;

    try
    {
        manager.create(type, nullptr, 3);
        FAIL() << "Expected std::runtime_error";
    } catch (const std::runtime_error& e)
    {
        EXPECT_TRUE(std::string(e.what()).find("memory") != std::string::npos)
            << "Exception message does not specify 'memory' type";
    }
}

TEST_F(DataManagerTest, CreateRecordFailureWithDiskType)
{
    DataManager manager;
    auto type = data_record_type::disk;

    try
    {
        manager.create(type, nullptr, 3);
        FAIL() << "Expected std::runtime_error";
    } catch (const std::runtime_error& e)
    {
        EXPECT_TRUE(std::string(e.what()).find("disk") != std::string::npos)
            << "Exception message does not specify 'disk' type";
    }
}

// Test for create using a std::vector<uint8_t>
TEST_F(DataManagerTest, CreateRecordFromVector) {
    DataManager manager;
    std::vector<uint8_t> data = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({
        std::string uuid = manager.create(data_record_type::memory, data);
        // Add code to validate UUID format if needed.
    }) << "Failed to create DataRecord from std::vector<uint8_t>";
}

TEST_P(DataManagerParameterizedTypeTest, CreateRecord)
{
    DataManager manager;
    auto type                 = GetParam();
    uint8_t bytes[5] = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({
        std::string uuid = manager.create(type, bytes, 5);
        // Add code to validate uuid format if needed.
    });
}

TEST_P(DataManagerParameterizedTypeTest, CreateRecordFailure)
{
    DataManager manager;
    auto type                 = static_cast<data_record_type>(-1);  // Invalid type
    uint8_t bytes[5] = {1, 2, 3, 4, 5};

    ASSERT_THROW({ manager.create(type, bytes, 5); }, std::runtime_error)
        << "Should throw runtime_error for invalid data record type";
}

// Run the DataManagerTest for both memory and disk data_record_types
INSTANTIATE_TEST_SUITE_P(DataRecordTypes,
                         DataManagerParameterizedTypeTest,
                         ::testing::Values(morpheus::io::data_record_type::memory,
                                           morpheus::io::data_record_type::disk));

TEST(DataManagerTests, CreateAsync) {
    DataManager manager;
    std::vector<uint8_t> data = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({
        auto future = manager.create_async(data_record_type::memory, data);
        std::string uuid = future.get();
        // Validate uuid format if needed.
    });
}

TEST(DataManagerTests, CreateAsyncInvalidType) {
    DataManager manager;
    std::vector<uint8_t> data = {1, 2, 3, 4, 5};

    ASSERT_THROW({
        auto future = manager.create_async(static_cast<data_record_type>(-1), data);
        future.get();
    }, std::runtime_error);
}