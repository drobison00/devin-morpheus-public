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
from datetime import datetime, timedelta
import json
import os
import typing

import srf
import srf.core.operators as ops

from morpheus.config import Config
from morpheus.messages import MessageMeta
from morpheus.pipeline.single_port_stage import SinglePortStage
from morpheus.pipeline.stream_pair import StreamPair


# TODO(Devin) : Generalize this, should have a pre-stage that breaks out each message so this can be used later.
class WriteToS3Stage(SinglePortStage):
    """
    This class writes messages to a file. This class does not buffer or keep the file open between messages.
    It should not be used in production code.

    Parameters
    ----------
    c : `morpheus.config.Config`
        Pipeline configuration instance.
    bucket: str
        Name of the s3 bucket to write to.

    """

    def __init__(self, c: Config, bucket: str):
        super().__init__(c)

        self._bucket = bucket

    @property
    def name(self) -> str:
        return "to-s3-bucket"

    def accepted_types(self) -> typing.Tuple:
        """
        Returns accepted input types for this stage.

        Returns
        -------
        typing.Tuple(`morpheus.pipeline.messages.MessageMeta`, )
            Accepted input types.

        """
        return (MessageMeta,)

    def supports_cpp_node(self):
        return False

    def _build_single(self, builder: srf.Builder, input_stream: StreamPair) -> StreamPair:
        stream = input_stream[0]

        node = builder.make_node(self.unique_name, self._write_results_s3)
        builder.make_edge(input_stream[0], node)

        stream = node

        # Return input unchanged to allow passthrough
        return stream, input_stream[1]

    def _write_results_s3(self, message: MessageMeta):
        """
        Write results to s3 bucket
        :param result_json:
        :return:
        """
        # TODO(Devin) : Credentials
        AWS_ACCESS_KEY_ID = "access_key_id"
        AWS_SECRET_ACCESS_KEY = "secret_access_key"
        AWS_SESSION_TOKEN = "session_token"
        CURRENT_DATE = datetime.now()
        CURRENT_DATE_NOW = datetime.now()
        FINAL_DATE = CURRENT_DATE_NOW - timedelta(hours=1)

        s3_resource = boto3.resource('s3', aws_access_key_id=AWS_ACCESS_KEY_ID,
                                     aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
                                     aws_session_token=AWS_SESSION_TOKEN
                                     )

        bucket = s3_resource.Bucket('kfp-azure-results')

        json_data = message.df.to_dict(orient="records")

        # TODO(Devin) : Do we really want to write every record as its own object file?
        for index, val in enumerate(json_data):
            s3_object = s3_resource.Object(self._bucket, f'hammah_azure_result_{index}.json')
            # TODO(Devin) (optimization) : can probably return records directly in json from dataframe
            s3_object.put(Body=bytes(json.dumps(val).encode('UTF-8')), ContentType='application/json')

        return message
