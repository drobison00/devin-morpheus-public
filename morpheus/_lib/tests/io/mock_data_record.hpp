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

#include "morpheus/io/data_record/data_record_base.hpp"

#include <cstring>

class MockDataRecordType1 : public morpheus::io::DataRecord
{
  public:
    void create(const uint8_t* bytes, std::size_t size) override
    {
        m_data.reset(new uint8_t[size]);
        std::memcpy(m_data.get(), bytes, size);
        m_size_bytes = size;
    }

    std::shared_ptr<uint8_t> read() override
    {
        return m_data;
    }

    void update(const uint8_t* bytes, std::size_t size) override
    {
        create(bytes, size);
    }

    void remove() override
    {
        m_data.reset();
        m_size_bytes = 0;
    }

    std::string backing_store() const override
    {
        return "mock_type_1";
    }

  private:
    std::shared_ptr<uint8_t> m_data;
};

class MockDataRecordType2 : public morpheus::io::DataRecord
{
  public:
    void create(const uint8_t* bytes, std::size_t size) override
    {
        m_data.reset(new uint8_t[size]);
        std::memcpy(m_data.get(), bytes, size);
        m_size_bytes = size;
    }

    std::shared_ptr<uint8_t> read() override
    {
        return m_data;
    }

    void update(const uint8_t* bytes, std::size_t size) override
    {
        create(bytes, size);
    }

    void remove() override
    {
        m_data.reset();
        m_size_bytes = 0;
    }

    std::string backing_store() const override
    {
        return "mock_type_2";
    }

  private:
    std::shared_ptr<uint8_t> m_data;
};