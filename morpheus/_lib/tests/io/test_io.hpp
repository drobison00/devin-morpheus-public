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

#include "morpheus/io/data_manager.hpp"
#include "../test_utils/common.hpp"  // IWYU pragma: associated

namespace morpheus::test {

using TestLoader             = TestWithPythonInterpreter;  // NOLINT
using TestDataLoader         = TestWithPythonInterpreter;  // NOLINT
using TestDataLoaderRegistry = TestWithPythonInterpreter;  // NOLINT

class DataManagerTest : public ::testing::Test {
  protected:
    morpheus::io::DataManager m_data_manager; // Instance of the class under test

    // SetUp will be called before each test in this fixture
    void SetUp() override {
        // Initialization code here
    }

    // TearDown will be called after each test in this fixture
    void TearDown() override {
        // Cleanup code here
    }
};

}  // namespace morpheus::test
