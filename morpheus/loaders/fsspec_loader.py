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

import fsspec
import fsspec.utils

import cudf

from morpheus.messages import MessageControl
from morpheus.messages.message_meta import MessageMeta
from morpheus.utils.loader_ids import FSSPEC_LOADER
from morpheus.utils.loader_utils import register_loader

logger = logging.getLogger(__name__)

dask_cluster = None


@register_loader(FSSPEC_LOADER)
def fsspec_loader(control_message: MessageControl, task: dict) -> MessageControl:
    """
    Loads data from external sources using the fsspec library, and returns an updated MessageControl
    object with payload as MessageMeta, which contains a dataframe with file names and data.

    Parameters
    ----------
    control_message : MessageControl
        The MessageControl object containing the pipeline control message.
    task : typing.Dict[any, any]
        A dictionary representing the current task in the pipeline control message.

    Returns
    -------
    control_message : MessageControl
        An updated MessageControl object with payload as a MessageMeta containing a dataframe
        with file names and data.

    Raises
    ------
    RuntimeError:
        If no files matched the input strings specified in the task, or if there was an error loading the data.
    """

    files = task.get("files", [])

    file_objects: fsspec.core.OpenFiles = fsspec.open_files(files)

    if (len(file_objects) == 0):
        raise RuntimeError(f"No files matched input strings: '{files}'. "
                           "Check your input pattern and ensure any credentials are correct")

    full_filenames = []

    for file_object in file_objects:
        full_filenames.append(file_object.full_name)

    df = cudf.DataFrame(full_filenames, columns=['files'])

    control_message.payload(MessageMeta(df=df))

    return control_message
