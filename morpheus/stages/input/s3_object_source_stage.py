# Copyright (c) 2021-2022, NVIDIA CORPORATION.
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

import boto3
import logging

import srf

from morpheus.config import Config
from morpheus.messages import MessageMeta
from morpheus.pipeline.single_output_source import SingleOutputSource
from morpheus.pipeline.stream_pair import StreamPair

logger = logging.getLogger(__name__)


class S3BucketSourceStage(SingleOutputSource):
    """
    Source stage is used to load objects from an s3 resource and pushing them to the pipeline.

    Parameters
    ----------
    c : `morpheus.config.Config`
        Pipeline configuration instance.
    object_generator: generator function which will produce s3 objects until exhausted
    """

    def __init__(self,
                 c: Config,
                 object_generator=None,
                 ):

        super().__init__(c)

        if (object_generator is None):
            raise RuntimeError("Object aggregator function cannot be None")

        self._object_generator = object_generator

    @property
    def name(self) -> str:
        return "object-from-s3"

    @property
    def input_count(self) -> int:
        """Return None for no max intput count"""
        return self._input_count

    def supports_cpp_node(self):
        return False

    def _build_source(self, builder: srf.Builder) -> StreamPair:

        out_stream = builder.make_source(self.unique_name, self._object_generator())

        out_type = type(boto3.Session().resource('s3').Object("_", "_"))

        return out_stream, out_type
