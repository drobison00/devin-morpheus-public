# Copyright (c) 2023, NVIDIA CORPORATION.
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

import logging

from morpheus.llm import LLMContext
from morpheus.llm import LLMTaskHandler

logger = logging.getLogger(__name__)


class SimpleTaskHandler(LLMTaskHandler):

    def __init__(self, output_columns: list[str] = None) -> None:
        super().__init__()

        if (output_columns is None):
            self._output_columns = ["response"]

    def get_input_names(self):
        return self._output_columns

    async def try_handle(self, context: LLMContext):

        input_dict = context.get_inputs()

        with context.message().payload().mutable_dataframe() as df:
            # Write the values to the dataframe
            for key, value in input_dict.items():
                df[key] = value

        return [context.message()]