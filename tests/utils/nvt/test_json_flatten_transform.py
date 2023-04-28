# Copyright (c) 2022-2023, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import unittest
import pandas as pd
import cudf
from merlin.dag import ColumnSelector

from morpheus.utils.nvt import json_flatten


def setUp():
    json_data = [
        '{"key1": "value1", "key2": {"subkey1": "subvalue1", "subkey2": "subvalue2"}}',
        '{"key1": "value2", "key2": {"subkey1": "subvalue3", "subkey2": "subvalue4"}}',
        '{"key1": "value3", "key2": {"subkey1": "subvalue5", "subkey2": "subvalue6"}}'
    ]

    expected_pdf = pd.DataFrame({
        'col1.key1': ['value1', 'value2', 'value3'],
        'col1.key2.subkey1': ['subvalue1', 'subvalue3', 'subvalue5'],
        'col1.key2.subkey2': ['subvalue2', 'subvalue4', 'subvalue6']
    })

    return json_data, expected_pdf


def test_json_flatten_pandas():
    json_data, expected_pdf = setUp()
    pdf = pd.DataFrame({'col1': json_data})
    col_selector = ColumnSelector(['col1'])

    result_pdf = json_flatten(col_selector, pdf)
    pd.testing.assert_frame_equal(result_pdf, expected_pdf)


def test_json_flatten_cudf():
    json_data, expected_pdf = setUp()
    cdf = cudf.DataFrame({'col1': json_data})
    col_selector = ColumnSelector(['col1'])

    result_cdf = json_flatten(col_selector, cdf)
    result_pdf = result_cdf.to_pandas()

    pd.testing.assert_frame_equal(result_pdf, expected_pdf)


# Run tests
if (__name__ in ("__main__",)):
    test_json_flatten_pandas()
    test_json_flatten_cudf()