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

import logging
import typing

import srf

from morpheus.config import Config
from morpheus.pipeline.single_port_stage import SinglePortStage
from morpheus.pipeline.single_output_source import SingleOutputSource
from morpheus.pipeline.stream_pair import StreamPair

logger = logging.getLogger(__name__)


class LinearBoundaryEgressStage(SinglePortStage):
    """
    Parameters
    ----------
    c : `morpheus.config.Config`
        Pipeline configuration instance.

    """

    def __init__(self, c: Config, boundary_port_id: str):
        super().__init__(c)

        self._port_id = boundary_port_id

    @property
    def name(self) -> str:
        return "linear_segment_boundary"

    def accepted_types(self) -> typing.Tuple:
        """
        Accepted input types for this stage are returned.

        Returns
        -------
        typing.Tuple
            Accepted input types.

        """
        return (typing.Any,)

    def supports_cpp_node(self):
        return False

    def _build_single(self, builder: srf.Builder, input_stream: StreamPair) -> StreamPair:
        boundary_egress = builder.get_egress(self._port_id)
        builder.make_edge(input_stream[0], boundary_egress)

        return boundary_egress, input_stream[1]


class LinearBoundaryIngressStage(SingleOutputSource):
    """
    Parameters
    ----------
    c : `morpheus.config.Config`
        Pipeline configuration instance.

    """

    def __init__(self, c: Config, boundary_port_id: str):
        super().__init__(c)

        self._port_id = boundary_port_id

    @property
    def name(self) -> str:
        return "segment_boundary_ingress"

    def accepted_types(self) -> typing.Tuple:
        """
        Accepted input types for this stage are returned.

        Returns
        -------
        typing.Tuple
            Accepted input types.

        """
        return (typing.Any,)

    def supports_cpp_node(self):
        return False

    def _build_source(self, builder: srf.Builder) -> StreamPair:
        boundary_ingress = builder.get_ingress(self._port_id)
        source = builder.make_node(self.unique_name, lambda data: data)

        builder.make_edge(boundary_ingress, source)

        return source, typing.Any
