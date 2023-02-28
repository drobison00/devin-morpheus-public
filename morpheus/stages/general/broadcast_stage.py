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
import typing

import mrc
from mrc.core.node import Broadcast

from morpheus.config import Config
from morpheus.pipeline.stage import Stage
from morpheus.pipeline.stream_pair import StreamPair

logger = logging.getLogger(__name__)


class BroadcastStage(Stage):
    """
    Depending on the number of output ports specified, this stage broadcast messages to one or more nodes.


    Parameters
    ----------
    output_port_count : int
        Output port count to broad cast messages.
    """

    def __init__(self, c: Config, output_port_count: int = 2):

        super().__init__(c)

        assert output_port_count > 0, "Output port count must be >= 1"

        self._create_ports(1, output_port_count)
        self._output_port_count = output_port_count

    @property
    def name(self) -> str:
        return "broadcast"

    def supports_cpp_node(self):
        return False

    def input_types(self) -> typing.Tuple:
        """
        Returns input type for the current stage.
        """

        return (typing.Any, )

    def accepted_types(self) -> typing.Tuple:
        """
        Accepted input types for this stage are returned.

        Returns
        -------
        typing.Tuple
            Accepted input types.

        """
        return (typing.Any, )

    def _get_broadcast_node(self, builder) -> Broadcast:
        # Create a broadcast node
        node = Broadcast(builder, "broadcast")
        return node

    def _build(self, builder: mrc.Builder, in_stream_pairs: typing.List[StreamPair]) -> typing.List[StreamPair]:

        assert len(in_stream_pairs) == 1, "Only 1 input is supported"

        in_stream_node = in_stream_pairs[0][0]
        output_type = in_stream_pairs[0][1]

        node = self._get_broadcast_node(builder)

        builder.make_edge(in_stream_node, node)

        out_stream_pairs = []

        count = 0
        while (count < self._output_port_count):
            out_stream_pairs.append((node, output_type))
            count += 1

        return out_stream_pairs