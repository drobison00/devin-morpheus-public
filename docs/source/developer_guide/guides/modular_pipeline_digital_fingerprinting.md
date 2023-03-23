# Introduction to Digital Fingerprinting Pipeline in Morpheus

## Table of Contents

1. [Introduction](#introduction)
2. [Setting up Morpheus](#setting-up-morpheus)
2. [Morpheus Modules](#morpheus-modules)
3. [dfp_deployment](#dfp_deployment)
    1. [fsspec_dataloader](#fsspec_dataloader)
4. [dfp_training_pipeline](#dfp_training_pipeline)
    1. [dfp_preproc](#dfp_preproc)
        1. [filter_control_messages](#filter_control_messages)
        2. [file_batcher](#file_batcher)
        3. [file_to_df_dataloader](#file_to_df_dataloader)
        4. [dfp_split_users](#dfp_split_users)
    2. [dfp_rolling_window](#dfp_rolling_window)
    3. [dfp_data_prep](#dfp_data_prep)
    4. [dfp_inference](#dfp_inference)
    5. [filter_detections](#filter_detections)
    6. [dfp_post_proc](#dfp_post_proc)
    7. [serialize](#serialize)
    8. [write_to_file](#write_to_file)
5. [dfp_inference_pipeline](#dfp_inference_pipeline)
    1. [dfp_preproc](#dfp_preproc-1)
        1. [filter_control_messages](#filter_control_messages-1)
        2. [file_batcher](#file_batcher-1)
        3. [file_to_df_dataloader](#file_to_df_dataloader-1)
        4. [dfp_split_users](#dfp_split_users-1)
    2. [dfp_rolling_window](#dfp_rolling_window-1)
    3. [dfp_data_prep](#dfp_data_prep-1)
    4. [dfp_training](#dfp_training)
    5. [mlflow_model_writer](#mlflow_model_writer)
6. [Combining modules and creating the pipeline](#combining-modules-and-creating-the-pipeline)
7. [Conclusion](#conclusion)

## Introduction

### Motivation

<a id="introduction"></a>
This document presents the adaptation of the Digital Fingerprinting pipeline in Morpheus from the existing stage-based
approach to one that is module-based; this process will provide a basis to work through motivation and
usage examples for number of new features found in the 23.03 release. The updated pipeline incorporates extensions
to facilitate event-driven workflows and human-in-the-loop interactions through the use of control messages.
Moreover, it introduces a dynamic method for acquiring and loading data, further enhancing the pipeline's capabilities.

The pipeline comprises a series of interconnected modules designed to create a versatile split processing pipeline.
This design enables the reception and processing of control messages to perform tasks such as inference against observed
events using either generic or user-specific models. Additionally, the pipeline can train new models based on aggregated
or predefined training data, offering a more adaptable and user-friendly experience.

### Overview

At a high level, the pipeline consists of three parts: the front-end file list loader that reads new control messages
from a Kafka topic and expands the described data sources to be processed, and the training and inference pipelines that
process the data. The updated pipeline enables the reception and processing of control messages, allowing for tasks such
as inference against observed events using generic or user-specific models. It also allows for the training of new
models based on aggregated or predefined training data.

The front-end loader outputs one or more control messages that are passed to the training and inference pipelines.
Messages are either dropped or passed to the next module in the pipeline based on the message type. The updated pipeline
implicitly supports two distinct workflows: inference and training. However, because of the use of control messages, it
can also support a hybrid data processing workflow that handles both streaming data processed in real-time, aggregated,
batched, and subsequently used for training, as well as interleaved self-contained training tasks that specify the
training data to be used and are able to bypass batching and aggregation stages.

Moreover, the updated pipeline supports human-in-the-loop workflows, such as the ability to manually trigger training or
inference tasks against a specific set of data, and the capacity for real-time labeling of production inference events
that can be injected back into the training pipeline.

The following content will track the pipeline declared in
`examples/digitial_fingerprinting/production/dfp_morpheus_streaming_pipeline.py`

```python
# Setup and command line argument parsing
...

# Create an empty pipeline
pipeline = Pipeline(config)

# Create our Kafka source stage that we can read control messages from.
source_stage = pipeline.add_stage(
    ControlMessageKafkaSourceStage(config,
                                   bootstrap_servers=kwargs["bootstrap_servers"],
                                   input_topic=kwargs["input_topic"],
                                   group_id=kwargs["group_id"],
                                   poll_interval=kwargs["poll_interval"],
                                   disable_commit=kwargs["disable_commit"],
                                   disable_pre_filtering=kwargs["disable_pre_filtering"]))

# Create our DFP deployment stage that will load our Digital Fingerprinting module into the pipeline.
dfp_deployment_stage = pipeline.add_stage(
    MultiPortModulesStage(config,
                          dfp_deployment_module_config,
                          input_port_name="input",
                          output_port_name_prefix="output",
                          num_output_ports=num_output_ports))

# Connect the source stage to the DFP deployment module
pipeline.add_edge(source_stage, dfp_deployment_stage)

# Run the pipeline
pipeline.run()
```

## Setting up Morpheus

<a id="setting-up-morpheus"></a>
For a full introduction in how to set up and run morpheus, please refer to
the [Getting Started]() guide.

## Morpheus Modules

<a id="morpheus-modules"></a>
For a full introduction to Morpheus modules, please refer to the [Python Modules](7_python_modules.md)
and [C++ Modules](8_cpp_modules.md) guides.

## DFP Deployment

<a id="dfp_deployment"></a>
Source: `examples/digitial_fingerprinting/production/morpheus/dfp/modules/dfp_deployment.py`

This is the top level module that encapsulates the entire Digital Fingerprinting pipeline, it is primarily
responsible for wrapping the training and inference pipelines, providing the correct module interface, and doing
some configuration pre-processing. Since this module is monolithic, it supports a significant number of
configuration options; however, the majority of these have intelligent defaults and are not required to be specified.

The module consists of three chained sub-modules:

- `fs_spec_dataloader`
    - Responsible for expanding data source declarations into individual files that can be processed by the pipeline.
- `dfp_training`
    - Connected to the output of the preprocessing stage. Responsible for handling training based control messages.
- `dfp_inference`
    - Connected to the output of the preprocessing stage. Responsible for handling inference based control messages.

For a complete reference, see: [DFP Deployment](./docs/source/modules/examples/digital_fingerprinting/dfp_deployment.md)

```python
@register_module(DFP_DEPLOYMENT, MORPHEUS_MODULE_NAMESPACE)
def dfp_deployment(builder: mrc.Builder):
    # Setup and configuration parsing
    ...

    # Make an edge between modules
    builder.make_edge(fsspec_dataloader_module.output_port("output"), broadcast)
    builder.make_edge(broadcast, dfp_training_pipe_module.input_port("input"))
    builder.make_edge(broadcast, dfp_inference_pipe_module.input_port("input"))

    out_streams = [dfp_training_pipe_module.output_port("output"), dfp_inference_pipe_module.output_port("output")]

    # Register input port for a module.
    builder.register_module_input("input", fsspec_dataloader_module.input_port("input"))
```

## FS Spec Dataloader

<a id="fsspec_dataloader"></a>
Source: `morpheus/loaders/fsspec_loader.py`

This is an instance of the new DataLoader module, utilizing a pre-defined 'fsspec' style loader. The module is used to
transform regex specified file lists into individual file paths and update the control message with those paths.

For a complete reference,
see: [DataLoader Module](./docs/source/modules/core/data_loader.md)

## DFP Training and Inference Pipelines

<a id="dfp_training_and_inference_pipelines"></a>
There are a number of modules that are used in both the training and inference pipelines, but which are be
configured independently. We'll introduce Shared modules here and then dive into the unique modules for each pipeline.

### DFP Preprocessing

<a id="dfp_preproc"></a>
Source: `examples/digitial_fingerprinting/production/morpheus/dfp/modules/dfp_preproc.py`

The dfp_preproc module is a functional component within the MORPHEUS framework that combines multiple data filtering and
processing (dfp) pipeline modules related to inference and training. This module simplifies the pipeline by
consolidating various modules into a single, cohesive unit. The dfp_preproc module offers configurability for parameters
such as cache directory, timestamp column name, pre-filter options, batching options, user splitting options, and
supported data loaders for different file types.

The module itself consists of a series of chained sub-modules, which are connected in a logical sequence:

- `filter_control_message_module`
    - Responsible for early filtering of control messages that should be not processed by the pipeline.
- `file_batcher_module`
    - Responsible for batching files, either into a single control message in the case of an encapsulated training
      message,
      or into a series of control messages in the of streaming data.
- `file_to_df_dataloader_module`
    - Responsible for file retrieval and insertion into a cuDF dataframe.
- `dfp_split_users_module`
    - Responsible for splitting the dataframe into a series of dataframes, one per user.

For a complete reference, see: [DFP Preproc](./docs/source/modules/examples/digital_fingerprinting/dfp_preproc.md)

```python
@register_module(DFP_PREPROC, MORPHEUS_MODULE_NAMESPACE)
def dfp_preproc(builder: mrc.Builder):
    # Setup and configuration parsing
    ...

    # Connect the modules.
    builder.make_edge(filter_control_message_module.output_port("output"), file_batcher_module.input_port("input"))
    builder.make_edge(file_batcher_module.output_port("output"), file_to_df_dataloader_module.input_port("input"))
    builder.make_edge(file_to_df_dataloader_module.output_port("output"), dfp_split_users_module.input_port("input"))

    # Register input and output port for a module.
    builder.register_module_input("input", filter_control_message_module.input_port("input"))
    builder.register_module_output("output", dfp_split_users_module.output_port("output"))

```

#### Control Message Filter

<a id="filter_control_messages"></a>
Source: `morpheus/modules/filter_control_message.py`

The filter_control_message module is a component designed to discard control messages based on specified filtering
criteria. This module allows users to configure filtering options such as task type and data type. When either task
filtering or data type filtering is enabled, the module processes control messages to verify if they meet the
specified criteria. If the control message does not match the criteria, it is discarded. The module uses a node
function to filter and process control messages, and registers input and output ports to facilitate seamless
integration into the data processing pipeline.

For a complete reference, see: [Filter Control Message](./modules/core/filter_control_message.md)

#### File Batcher

<a id="file_batcher"></a>
Source: `morpheus/modules/file_batcher.py`

The file_batcher module is a component that is responsible for loading input files, filtering out
files older than the specified time window, and grouping the remaining files by periods that fall within the time
window. This module offers configurability for parameters such as batching options, cache directory, file type,
filtering null values, data schema, and the timestamp column name. The file_batcher module processes control messages,
validates them, and generates a list of files with their timestamps. The module then groups files by the given period,
creates control messages for each batch, and sends them downstream for further processing. A node function is used to
handle the processing of control messages, and input and output ports are registered to integrate the module into the
data processing pipeline seamlessly.

The file batcher is one of the first pipeline components that begins to differ more substantially from the previous
raw-data pipeline, prior to 23.03. In addition to its previous functionality, the file batcher is now control
message aware, and can handle both streaming and encapsulated control messages, a property denoted by the `data_type`
property of the control message's metadata being set as either `streaming` or `payload`. Additionally, the file
batcher's default processing criteria for `period`, `sampling_rate_s`, `start_time`, and `end_time` can now be
overridden by their corresponding values in the control message's `batching_options` metadata entry.

In the case of streaming data, the file batcher will operate as it did previously, grouping files by the specified
by the `period`, `sampling_rate_s`, `start_time`, and `end_time` properties, creating a control message for each
batch, and forwarding them downstream. In the case of encapsulated data, the file batcher will operate similarly, but
will only create a single control message for the entire payload, and forward it downstream. In this way, it is
possible to attach all the necessary training data to a given training task, and skip any downstream aggregation.

For a complete reference, see: [File Batcher](./docs/source/modules/core/file_batcher.md)

```python
@register_module(FILE_BATCHER, MORPHEUS_MODULE_NAMESPACE)
def file_batcher(builder: mrc.Builder):
    # Setup and configuration parsing
    ...
```

#### File to DF DataLoader

<a id="file_to_df_dataloader"></a>
Source: `morpheus/loaders/file_to_df_dataloader.py`

This is an instance of the new DataLoader module, utilizing a pre-defined 'file_to_df' style loader. The module is
used to process 'load' tasks that reference files which need to be retrieved, possibly cached, and then loaded into a
cuDF dataframe with is set as the control message payload.

For a complete reference,
see: [DataLoader Module](./docs/source/modules/core/data_loader.md)

#### dfp_split_users

<a id="dfp_split_users"></a>
Source: `examples/digital_fingerprinting/production/morpheus/dfp/modules/dfp_split_users.py`

The dfp_split_users module is responsible for splitting the input data based on
user IDs. The module provides configuration options, such as fallback username, include generic user, include individual
users, and specify lists of user IDs to include or exclude in the output.

The module processes control messages by extracting the user information from the message
payload, filtering the data based on the provided configuration, and splitting the data by user ID. For each user ID,
the function generates a new control message containing the corresponding data and sends it downstream for further
processing.

For a complete reference,
see: [DFP Split Users](./docs/source/modules/examples/digital_fingerprinting/dfp_split_users.md)

```python
@register_module(DFP_SPLIT_USERS, MORPHEUS_MODULE_NAMESPACE)
def dfp_split_users(builder: mrc.Builder):
    # Setup and configuration parsing
    ...
```

### dfp_rolling_window

<a id="dfp_rolling_window"></a>

## DFP Training Pipeline

<a id="dfp_training_pipeline"></a>

The DFP Training Pipe module is a consolidated module that integrates several DFP pipeline modules that are essential to
the training process. This module function provides a single entry point to the training pipeline, simplifying the
process of training a model. The module offers configurable parameters for various stages in the pipeline, including
data batching, data preprocessing, and data encoding for model training. Additionally, the MLflow model writer options
allow for the trained model to be saved for future use.

For a complete reference, see: [DFP Training Pipe](modules/examples/digital_fingerprinting/dfp_training_pipe.md)

```python
@register_module(DFP_TRAINING_PIPE, MORPHEUS_MODULE_NAMESPACE)
def dfp_training_pipe(builder: mrc.Builder):
    # Setup and config parsing
    ...

    # Make an edge between the modules.
    builder.make_edge(preproc_module.output_port("output"), dfp_rolling_window_module.input_port("input"))
    builder.make_edge(dfp_rolling_window_module.output_port("output"), dfp_data_prep_module.input_port("input"))
    builder.make_edge(dfp_data_prep_module.output_port("output"), dfp_training_module.input_port("input"))
    builder.make_edge(dfp_training_module.output_port("output"), mlflow_model_writer_module.input_port("input"))

    # Register input and output port for a module.
    builder.register_module_input("input", preproc_module.input_port("input"))
    builder.register_module_output("output", mlflow_model_writer_module.output_port("output"))
```

### DFP Preprocessing

<a id="dfp_preproc"></a>
Source: `morpheus/modules/examples/digital_fingerprinting/dfp_preproc.py`

#### filter_control_messages

<a id="filter_control_messages"></a>

#### file_batcher

<a id="file_batcher"></a>

#### file_to_df_dataloader

<a id="file_to_df_dataloader"></a>

#### dfp_split_users

<a id="dfp_split_users"></a>

### dfp_rolling_window

<a id="dfp_rolling_window"></a>

### dfp_data_prep

<a id="dfp_data_prep"></a>

### dfp_inference

<a id="dfp_inference"></a>

### filter_detections

<a id="filter_detections"></a>

### dfp_post_proc

<a id="dfp_post_proc"></a>

### serialize

<a id="serialize"></a>

### write_to_file

<a id="write_to_file"></a>

## dfp_inference_pipeline

<a id="dfp_inference_pipeline"></a>

### dfp_preproc

<a id="dfp_preproc-1"></a>

#### filter_control_messages

<a id="filter_control_messages-1"></a>

#### file_batcher

<a id="file_batcher-1"></a>

#### file_to_df_dataloader

<a id="file_to_df_dataloader-1"></a>

#### dfp_split_users

<a id="dfp_split_users-1"></a>

### dfp_rolling_window

<a id="dfp_rolling_window-1"></a>

### dfp_data_prep

<a id="dfp_data_prep-1"></a>

### dfp_training

<a id="dfp_training"></a>

### mlflow_model_writer

<a id="mlflow_model_writer"></a>

## Combining modules and creating the pipeline

<a id="combining-modules-and-creating-the-pipeline"></a>

## Conclusion

<a id="conclusion"></a>