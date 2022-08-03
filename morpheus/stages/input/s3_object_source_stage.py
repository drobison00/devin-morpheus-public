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

from morpheus._lib.file_types import FileTypes
from morpheus.config import Config
from morpheus.messages import MessageMeta
from morpheus.pipeline.single_output_source import SingleOutputSource
from morpheus.pipeline.stream_pair import StreamPair

logger = logging.getLogger(__name__)


class S3BucketSourceStage(SingleOutputSource):
    """
    Source stage is used to load messages from a file and dumping the contents into the pipeline immediately. Useful for
    testing performance and accuracy of a pipeline.

    Parameters
    ----------
    c : `morpheus.config.Config`
        Pipeline configuration instance.
    bucket : str
        Name of the s3 bucket to pull data from.
    file_type : `morpheus._lib.file_types.FileTypes`, default = 'auto'
        Indicates what type of file to read. Specifying 'auto' will determine the file type from the extension.
        Supported extensions: 'json', 'csv'
    cudf_kwargs: dict, default=None
        keyword args passed to underlying cuDF I/O function. See the cuDF documentation for `cudf.read_csv()` and
        `cudf.read_json()` for the available options. With `file_type` == 'json', this defaults to ``{ "lines": True }``
        and with `file_type` == 'csv', this defaults to ``{}``.
    """

    def __init__(self,
                 c: Config,
                 aws_access_key_id: str,
                 aws_secret_access_key: str,
                 aws_session_token: str,
                 object_aggregator=None,  # Given an s3 resource, aggregates and returns a list of objects
                 ):

        super().__init__(c)

        if (object_aggregator is None):
            raise RuntimeError("Object aggregator function cannot be None")

        self._aws_access_key_id = aws_access_key_id
        self._aws_secret_access_key = aws_secret_access_key
        self._aws_session_token = aws_session_token
        self._object_aggregator = object_aggregator

    @property
    def name(self) -> str:
        return "from-s3-bucket"

    @property
    def input_count(self) -> int:
        """Return None for no max intput count"""
        return self._input_count

    def supports_cpp_node(self):
        return False

    def _build_source(self, builder: srf.Builder) -> StreamPair:

        out_stream = builder.make_source(self.unique_name, self._generate_frames())

        out_type = MessageMeta

        return out_stream, out_type

    def _get_s3_objects(self):
        session = boto3.Session(aws_access_key_id=self._aws_access_key_id,
                                aws_secret_access_key=self._aws_secret_access_key,
                                aws_session_token=self._aws_session_token)

        s3 = session.resource('s3')

        return self._object_aggregator(s3)

    def _generate_objects(self):
        objects = self._get_s3_objects()

        for object in objects:
            yield object
