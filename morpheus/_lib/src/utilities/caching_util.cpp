/*
 * SPDX-FileCopyrightText: Copyright (c) 2021-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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

#include "morpheus/utilities/caching_util.hpp"

#include <pybind11/pybind11.h>

#include <functional>
#include <map>
#include <regex>
#include <string>

// TODO(Devin): For testing
static std::map<std::string, std::function<std::shared_ptr<mrc::segment::ObjectProperties>(mrc::segment::IBuilder&)>>
    cpp_function_cache{};

namespace py = pybind11;

namespace {
// Function to check if the py::object is a callable that takes a single argument
bool is_single_argument_callable(const py::object& obj)
{
    py::gil_scoped_acquire gil;

    if (!py::getattr(py::module_::import("builtins"), "callable")(obj).cast<bool>())
    {
        return false;
    }

    py::object inspect    = py::module_::import("inspect");
    py::object signature  = inspect.attr("signature")(obj);
    py::object parameters = signature.attr("parameters");
    return py::len(parameters) >= 1;
}
}  // namespace

std::function<std::shared_ptr<mrc::segment::ObjectProperties>(mrc::segment::IBuilder&)>
morpheus::retrieve_cached_initializer(const std::string& uuid)
{
    auto& py_cache_handle = mrc::pymrc::PythonObjectCache::get_handle();

    if (py_cache_handle.contains(uuid))
    {
        py::gil_scoped_acquire gil;
        py::object py_object = py_cache_handle.pop(uuid);

        if (!is_single_argument_callable(py_object))
        {
            throw std::runtime_error("Python object is not a single-argument callable");
        }

        // Return a lambda that wraps the Python object call
        return [py_object](mrc::segment::IBuilder& builder) -> std::shared_ptr<mrc::segment::ObjectProperties> {
            py::gil_scoped_acquire gil;
            py::object result = py_object(builder);
            return py::cast<std::shared_ptr<mrc::segment::ObjectProperties>>(result);
        };
    }
    else if (cpp_function_cache.find(uuid) != cpp_function_cache.end())
    {
        // Return the std::function from the C++ cache
        return cpp_function_cache[uuid];
    }
    else
    {
        throw std::runtime_error("Cached initializer not found for UUID: " + uuid);
    }
}

pybind11::object morpheus::retrieve_cached_pyobject(const std::string& uuid)
{
    // Validate UUID format
    std::regex uuid_regex("^[0-9a-fA-F-]{36}$");
    if (!std::regex_match(uuid, uuid_regex))
    {
        throw std::runtime_error("Invalid UUID format");
    }

    auto& py_cache_handle = mrc::pymrc::PythonObjectCache::get_handle();

    if (py_cache_handle.contains(uuid))
    {
        // Pop and return the Python object from the cache
        return py_cache_handle.pop(uuid);
    }
    else
    {
        throw std::runtime_error("Python object not found in cache for UUID: " + uuid);
    }
}