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
#include "mock_data_record.hpp"
#include "test_io.hpp"

#include "morpheus/io/data_manager.hpp"

#include <gtest/gtest.h>

#include <future>
#include <thread>

using namespace morpheus;
using namespace morpheus::test;
using namespace morpheus::io;

class DataManagerParameterizedTypeTest : public ::testing::TestWithParam<DataRecordType>
{};

TEST_F(DataManagerTest, ConcurrentCreate)
{
    DataManager manager;
    uint8_t bytes[3]      = {1, 2, 3};
    const int num_threads = 10;

    auto create_record = [&]() {
        for (int i = 0; i < 100; ++i)
        {
            ASSERT_NO_THROW({ std::string uuid = manager.create(DataRecordType::memory, bytes, 3); });
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
    auto type = DataRecordType::memory;

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
    auto type = DataRecordType::disk;

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
TEST_F(DataManagerTest, CreateRecordFromVector)
{
    DataManager manager;
    std::vector<uint8_t> data = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({ std::string uuid = manager.create(DataRecordType::memory, data); })
        << "Failed to create DataRecord from std::vector<uint8_t>";
}

TEST_P(DataManagerParameterizedTypeTest, CreateRecord)
{
    DataManager manager;
    auto type        = GetParam();
    uint8_t bytes[5] = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({ std::string uuid = manager.create(type, bytes, 5); });
}

TEST_F(DataManagerTest, CreateWithFactoryFunction)
{
    DataManager manager;
    auto factory_func         = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    std::vector<uint8_t> data = {0, 1, 2, 3};
    auto uuid                 = manager.create(factory_func, data.data(), data.size());
    EXPECT_FALSE(uuid.empty());
}

TEST_F(DataManagerTest, CreateAsyncWithFactoryFunction)
{
    DataManager manager;
    auto factory_func         = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    std::vector<uint8_t> data = {0, 1, 2, 3};
    auto future               = manager.create_async(factory_func, data);
    auto uuid                 = future.get();
    EXPECT_FALSE(uuid.empty());
}

TEST_P(DataManagerParameterizedTypeTest, CreateRecordFailure)
{
    DataManager manager;
    auto type        = static_cast<DataRecordType>(-1);  // Invalid type
    uint8_t bytes[5] = {1, 2, 3, 4, 5};

    ASSERT_THROW({ manager.create(type, bytes, 5); }, std::runtime_error)
        << "Should throw runtime_error for invalid data record type";
}

// Run the DataManagerTest for both memory and disk DataRecordTypes
INSTANTIATE_TEST_SUITE_P(DataRecordTypes,
                         DataManagerParameterizedTypeTest,
                         ::testing::Values(morpheus::io::DataRecordType::memory, morpheus::io::DataRecordType::disk));

TEST_F(DataManagerTest, CreateAsyncVector)
{
    DataManager manager;
    std::vector<uint8_t> data = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({
        auto future      = manager.create_async(DataRecordType::memory, data);
        std::string uuid = future.get();
        // Validate uuid format if needed.
    });
}

TEST_F(DataManagerTest, CreateAsyncBytes)
{
    DataManager manager;
    uint8_t bytes[5] = {1, 2, 3, 4, 5};

    ASSERT_NO_THROW({
        auto future      = manager.create_async(DataRecordType::memory, bytes, 5);
        std::string uuid = future.get();
        // Validate uuid format if needed.
    });
}

TEST_F(DataManagerTest, CreateAsyncInvalidType)
{
    DataManager manager;
    std::vector<uint8_t> data = {1, 2, 3, 4, 5};

    ASSERT_THROW(
        {
            auto future = manager.create_async(static_cast<DataRecordType>(-1), data);
            future.get();
        },
        std::runtime_error);
}

TEST_F(DataManagerTest, RemoveMethod)
{
    morpheus::io::DataManager manager;

    // Create a record first
    std::vector<uint8_t> data = {1, 2, 3};
    std::string uuid          = manager.create(morpheus::io::DataRecordType::memory, data);

    // Test removal
    bool result = manager.remove(uuid);
    ASSERT_TRUE(result);

    // Attempt to remove it again should return false
    result = manager.remove(uuid);
    ASSERT_FALSE(result);
}

TEST_F(DataManagerTest, RemoveMethodAsync)
{
    morpheus::io::DataManager manager;

    // Create a record first
    std::vector<uint8_t> data = {1, 2, 3};
    std::string uuid          = manager.create(morpheus::io::DataRecordType::memory, data);

    // Test async removal
    auto future_result = manager.remove_async(uuid);
    ASSERT_TRUE(future_result.get());

    // Attempt to remove it again should return false
    auto future_result_again = manager.remove_async(uuid);
    ASSERT_FALSE(future_result_again.get());
}

TEST_F(DataManagerTest, GetManifest)
{
    morpheus::io::DataManager manager;

    // Create some records
    std::vector<uint8_t> data1 = {1, 2, 3};
    std::string uuid1          = manager.create(morpheus::io::DataRecordType::memory, data1);

    std::vector<uint8_t> data2 = {4, 5, 6};
    std::string uuid2          = manager.create(morpheus::io::DataRecordType::memory, data2);

    // Get the manifest
    auto manifest = manager.get_manifest();

    // Check if both UUIDs are in the manifest
    ASSERT_TRUE(std::find(manifest.begin(), manifest.end(), uuid1) != manifest.end());
    ASSERT_TRUE(std::find(manifest.begin(), manifest.end(), uuid2) != manifest.end());
}

TEST_F(DataManagerTest, GetManifestWithAsyncAndSync)
{
    morpheus::io::DataManager manager;

    std::vector<std::string> uuids;
    std::vector<std::future<std::string>> future_uuids;

    std::vector<uint8_t> data = {1, 2, 3};

    // Create 25 records synchronously
    for (int i = 0; i < 25; ++i)
    {
        std::string uuid = manager.create(morpheus::io::DataRecordType::memory, data);
        uuids.push_back(uuid);
    }

    // Create 25 records asynchronously
    for (int i = 0; i < 25; ++i)
    {
        auto future_uuid = manager.create_async(morpheus::io::DataRecordType::memory, data);
        future_uuids.push_back(std::move(future_uuid));
    }

    // Retrieve the UUIDs from the async operations
    for (auto& future_uuid : future_uuids)
    {
        uuids.push_back(future_uuid.get());
    }

    // Get the manifest
    auto manifest = manager.get_manifest();

    // Verify that all UUIDs appear in the manifest
    for (const auto& uuid : uuids)
    {
        ASSERT_TRUE(std::find(manifest.begin(), manifest.end(), uuid) != manifest.end());
    }
}

TEST_F(DataManagerTest, SyncReadAndUpdate)
{
    DataManager dm;

    auto factory_func = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    std::vector<uint8_t> initial_data = {1, 2, 3};
    std::string uuid                  = dm.create(factory_func, initial_data.data(), initial_data.size());

    std::vector<uint8_t> new_data = {4, 5, 6};
    dm.update(uuid, new_data.data(), new_data.size());

    auto [updated_data, size] = dm.read(uuid);
    std::vector<uint8_t> updated_data_(updated_data.get(), updated_data.get() + size);
    ASSERT_EQ(new_data, updated_data_);
}

TEST_F(DataManagerTest, SyncReadAndMove)
{
    DataManager dm;

    auto factory_func1 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    auto factory_func2 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType2>(); };
    std::vector<uint8_t> initial_data = {1, 2, 3};
    std::string uuid                  = dm.create(factory_func1, initial_data.data(), initial_data.size());

    dm.move(uuid, factory_func2);

    auto [moved_data, size] = dm.read(uuid);
    std::vector<uint8_t> moved_data_(moved_data.get(), moved_data.get() + size);
    ASSERT_EQ(initial_data, moved_data_);
}

TEST_F(DataManagerTest, SyncUpdateMoveUpdate)
{
    DataManager dm;

    auto factory_func1 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    auto factory_func2 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType2>(); };
    std::vector<uint8_t> initial_data = {1, 2, 3};
    std::string uuid                  = dm.create(factory_func1, initial_data.data(), initial_data.size());

    std::vector<uint8_t> update_data = {4, 5, 6};
    dm.update(uuid, update_data.data(), update_data.size());

    dm.move(uuid, factory_func2);

    std::vector<uint8_t> final_data = {7, 8, 9};
    dm.update(uuid, final_data.data(), final_data.size());

    auto [result_data, size] = dm.read(uuid);
    std::vector<uint8_t> result_data_(result_data.get(), result_data.get() + size);

    ASSERT_EQ(final_data, result_data_);
}

TEST_F(DataManagerTest, SyncMoveUpdateMove)
{
    DataManager dm;

    auto factory_func1 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    auto factory_func2 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType2>(); };
    std::vector<uint8_t> initial_data = {1, 2, 3};
    std::string uuid                  = dm.create(factory_func1, initial_data.data(), initial_data.size());

    dm.move(uuid, factory_func1);

    std::vector<uint8_t> update_data = {4, 5, 6};
    dm.update(uuid, update_data.data(), update_data.size());

    dm.move(uuid, factory_func2);

    auto [result_data, size] = dm.read(uuid);
    std::vector<uint8_t> result_data_(result_data.get(), result_data.get() + size);

    ASSERT_EQ(update_data, result_data_);
}

TEST_F(DataManagerTest, AsyncUpdate)
{
    DataManager dm;

    auto factory_func1 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    std::vector<uint8_t> initial_data = {1, 2, 3};
    std::vector<uint8_t> update_data  = {4, 5, 6};

    auto uuid = dm.create(factory_func1, initial_data.data(), initial_data.size());

    // Asynchronous Update
    auto update_future = dm.update_async(uuid, update_data.data(), update_data.size());
    update_future.wait();

    // Validate Update
    auto [result_data, size] = dm.read(uuid);
    std::vector<uint8_t> result_data_(result_data.get(), result_data.get() + size);
    ASSERT_EQ(update_data, result_data_);
}

TEST_F(DataManagerTest, AsyncMove)
{
    DataManager dm;

    auto factory_func1 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    auto factory_func2 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType2>(); };
    std::vector<uint8_t> initial_data = {7, 8, 9};

    auto uuid = dm.create(factory_func1, initial_data.data(), initial_data.size());

    // Asynchronous Move
    auto move_future = dm.move_async(uuid, factory_func2);
    move_future.wait();

    // Validate Move
    auto [result_data, size] = dm.read(uuid);
    std::vector<uint8_t> result_data_(result_data.get(), result_data.get() + size);
    ASSERT_EQ(initial_data, result_data_);
}

TEST_F(DataManagerTest, AsyncMoveAndUpdate)
{
    DataManager dm;

    auto factory_func1 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType1>(); };
    auto factory_func2 = []() -> std::unique_ptr<DataRecord> { return std::make_unique<MockDataRecordType2>(); };
    std::vector<uint8_t> initial_data = {10, 11, 12};
    std::vector<uint8_t> update_data  = {13, 14, 15};

    auto uuid = dm.create(factory_func1, initial_data.data(), initial_data.size());

    // Asynchronous Move and Update
    auto move_future = dm.move_async(uuid, factory_func2);
    move_future.wait();

    auto update_future = dm.update_async(uuid, update_data.data(), update_data.size());
    update_future.wait();

    // Validate Move and Update
    auto [result_data, size] = dm.read(uuid);
    std::vector<uint8_t> result_data_(result_data.get(), result_data.get() + size);
    ASSERT_EQ(update_data, result_data_);
}

TEST_F(DataManagerTest, TestZeroLengthData) {
    DataManager dm;

    std::vector<uint8_t> zero_length_data;
    try {
        auto uuid = dm.create(DataRecordType::memory, zero_length_data);
        FAIL() << "Expected std::runtime_error";
    } catch (std::runtime_error const & err) {
        ASSERT_NE(std::string(err.what()).find("invalid data pointer"), std::string::npos);
    } catch (...) {
        FAIL() << "Expected std::runtime_error";
    }
}

TEST_F(DataManagerTest, TestUpdateWithNullPtr) {
    DataManager dm;

    // Create a record with some initial data
    std::vector<uint8_t> initial_data = {1, 2, 3};
    auto uuid = dm.create(DataRecordType::memory, initial_data);

    // Update with nullptr and zero size
    try {
        dm.update(uuid, nullptr, 0);
        FAIL() << "Expected std::runtime_error";
    } catch (std::runtime_error const & err) {
        ASSERT_NE(std::string(err.what()).find("invalid data pointer"), std::string::npos);
    } catch (...) {
        FAIL() << "Expected std::runtime_error";
    }
}

TEST_F(DataManagerTest, TestFailingFactoryFunction) {
    DataManager dm;

    // Create a record with some initial data
    std::vector<uint8_t> initial_data = {1, 2, 3};
    auto uuid = dm.create(DataRecordType::memory, initial_data);

    // Failing factory function that returns nullptr
    auto failing_factory_func = []() -> std::unique_ptr<DataRecord> { return nullptr; };

    try {
        // Attempt to move
        dm.move(uuid, failing_factory_func);
        FAIL() << "Expected std::runtime_error";
    } catch (std::runtime_error const & err) {
        ASSERT_EQ(err.what(), std::string("Failed to create new DataRecord"));
    } catch (...) {
        FAIL() << "Expected std::runtime_error";
    }
}

