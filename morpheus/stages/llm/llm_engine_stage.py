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

from morpheus.config import Config
from morpheus.llm import LLMEngine
from morpheus.messages import ControlMessage
from morpheus.pipeline.pass_thru_type_mixin import PassThruTypeMixin
from morpheus.pipeline.single_port_stage import SinglePortStage
from morpheus.utils.module_utils import load_module

logger = logging.getLogger(__name__)


class LLMEngineStage(PassThruTypeMixin, SinglePortStage):
    """
    Stage for executing an LLM engine within a Morpheus pipeline.

    Parameters
    ----------
    c : `morpheus.config.Config`
        Pipeline configuration instance.
    engine : `morpheus.llm.LLMEngine`
        LLM engine instance to execute.
   """

    def __init__(self, c: Config, *, engine_config: dict = None):
        super().__init__(c)

        self._module_config = {
            "module_id": "LLMEngine",
            "namespace": "morpheus",
            "module_name": "llm_engine",
            "engine_config": engine_config or {},
        }

    @property
    def name(self) -> str:
        """Return the name of the stage"""
        return "llm-engine"

    def accepted_types(self) -> typing.Tuple:
        """
        Returns accepted input types for this stage.

        Returns
        -------
        typing.Tuple(`ControlMessage`, )
            Accepted input types.

        """
        return (ControlMessage,)

    def supports_cpp_node(self):
        """Indicates whether this stage supports a C++ node."""
        return True

    def _build_single(self, builder: mrc.Builder, input_node: mrc.SegmentObject) -> mrc.SegmentObject:
        llm_engine_module = load_module(self._module_config, builder=builder)
        builder.make_edge(input_node, llm_engine_module.input_port("input"))

        return llm_engine_module.output_port("output")
