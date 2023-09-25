# =============================================================================
# Copyright (c) 2020-2023, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
# =============================================================================

include(GenerateExportHeader)

add_library(morpheus

  # Keep these sorted!
  src/io/data_loader.cpp
  src/io/data_loader_registry.cpp
  src/io/data_manager.cpp
  src/io/data_record/data_record_base.cpp
  src/io/data_record/disk_record.cpp
  src/io/data_record/memory_record.cpp
  src/io/deserializers.cpp
  src/io/loaders/file.cpp
  src/io/loaders/grpc.cpp
  src/io/loaders/lambda.cpp
  src/io/loaders/payload.cpp
  src/io/loaders/rest.cpp
  src/io/serializers.cpp
  src/messages/control.cpp
  src/messages/memory/inference_memory.cpp
  src/messages/memory/inference_memory.cpp
  src/messages/memory/inference_memory_fil.cpp
  src/messages/memory/inference_memory_nlp.cpp
  src/messages/memory/response_memory.cpp
  src/messages/memory/response_memory_probs.cpp
  src/messages/memory/tensor_memory.cpp
  src/messages/meta.cpp
  src/messages/multi.cpp
  src/messages/multi_inference.cpp
  src/messages/multi_inference_fil.cpp
  src/messages/multi_inference_nlp.cpp
  src/messages/multi_response.cpp
  src/messages/multi_response_probs.cpp
  src/messages/multi_tensor.cpp
  src/modules/data_loader_module.cpp
  src/objects/data_table.cpp
  src/objects/dev_mem_info.cpp
  src/objects/dtype.cpp
  src/objects/fiber_queue.cpp
  src/objects/file_types.cpp
  src/objects/memory_descriptor.cpp
  src/objects/mutable_table_ctx_mgr.cpp
  src/objects/python_data_table.cpp
  src/objects/rmm_tensor.cpp
  src/objects/table_info.cpp
  src/objects/tensor.cpp
  src/objects/tensor_object.cpp
  src/objects/wrapped_tensor.cpp
  src/stages/add_classification.cpp
  src/stages/add_scores.cpp
  src/stages/add_scores_stage_base.cpp
  src/stages/deserialize.cpp
  src/stages/file_source.cpp
  src/stages/filter_detection.cpp
  src/stages/http_server_source_stage.cpp
  src/stages/kafka_source.cpp
  src/stages/preprocess_fil.cpp
  src/stages/preprocess_nlp.cpp
  src/stages/serialize.cpp
  src/stages/triton_inference.cpp
  src/stages/write_to_file.cpp
  src/utilities/cudf_util.cpp
  src/utilities/cupy_util.cpp
  src/utilities/http_server.cpp
  src/utilities/matx_util.cu
  src/utilities/python_util.cpp
  src/utilities/string_util.cpp
  src/utilities/table_util.cpp
  src/utilities/tensor_util.cpp
)

add_library(${PROJECT_NAME}::morpheus ALIAS morpheus)

target_link_libraries(morpheus
  PRIVATE
    ${cudf_helpers_target}
    matx::matx

  PUBLIC
    cudf::cudf
    CUDA::nvToolsExt
    mrc::pymrc
    RDKAFKA::RDKAFKA
    TritonClient::httpclient_static
)

target_include_directories(morpheus
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/autogenerated/include> # Include the generated version file
    $<INSTALL_INTERFACE:include>
)

# Generates an include file for specifying external linkage since everything is hidden by default
generate_export_header(morpheus
  NO_EXPORT_MACRO_NAME
    MORPHEUS_LOCAL
  EXPORT_FILE_NAME
    "${CMAKE_BINARY_DIR}/autogenerated/include/morpheus/export.h"
)

# Ideally, we dont use glob here. But there is no good way to guarantee you dont miss anything like *.cpp
file(GLOB_RECURSE morpheus_public_headers
  LIST_DIRECTORIES FALSE
  CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_SOURCE_DIR}/include/morpheus/*"
)

# Add headers to target sources file_set so they can be installed
# https://discourse.cmake.org/t/installing-headers-the-modern-way-regurgitated-and-revisited/3238/3
target_sources(morpheus
  PUBLIC
    FILE_SET public_headers
    TYPE HEADERS
    FILES
  ${morpheus_public_headers}
)

# Add generated headers to fileset
target_sources(morpheus
  PUBLIC
    FILE_SET public_headers
    TYPE HEADERS
    BASE_DIRS
  "${CMAKE_BINARY_DIR}/autogenerated/include"
    FILES
  "${CMAKE_BINARY_DIR}/autogenerated/include/morpheus/version.hpp"
  "${CMAKE_BINARY_DIR}/autogenerated/include/morpheus/export.h"
)

# We want to use RUNPATH instead of RPATH to allow LD_LIBRARY_PATH to take precedence over the paths specified in the
# binary. This is necessary to allow ld to find the real libcuda.so instead of the stub. Eventually, this can be removed
# once upgraded to cuda-python 12.1. Ideally, cuda-python would just load libcuda.so.1 which would take precedence over
# libcuda.so. Relavant issue: https://github.com/NVIDIA/cuda-python/issues/17
target_link_options(morpheus PUBLIC "-Wl,--enable-new-dtags")

# required to link code containing pybind11 headers
target_link_options(morpheus PUBLIC "-Wl,--gc-sections")

set_target_properties(morpheus
  PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    CUDA_STANDARD 17
    CUDA_STANDARD_REQUIRED ON
)

install(
  TARGETS
    morpheus
  EXPORT
    ${PROJECT_NAME}-exports
  FILE_SET
    public_headers
  COMPONENT
    Wheel
)

if(MORPHEUS_PYTHON_INPLACE_BUILD)
  morpheus_utils_inplace_build_copy(morpheus ${CMAKE_CURRENT_SOURCE_DIR})
endif()
