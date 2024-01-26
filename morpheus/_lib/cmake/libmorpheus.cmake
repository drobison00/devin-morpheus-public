# =============================================================================
# Copyright (c) 2020-2024, NVIDIA CORPORATION.
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
  src/io/data_loader_registry.cpp
  src/io/data_loader.cpp
  src/io/deserializers.cpp
  src/io/loaders/file.cpp
  src/io/loaders/grpc.cpp
  src/io/loaders/lambda.cpp
  src/io/loaders/payload.cpp
  src/io/loaders/rest.cpp
  src/io/serializers.cpp
  src/llm/input_map.cpp
  src/llm/llm_context.cpp
  src/llm/llm_engine.cpp
  src/llm/llm_node_runner.cpp
  src/llm/llm_node.cpp
  src/llm/llm_task_handler_runner.cpp
  src/llm/llm_task.cpp
  src/llm/utils.cpp
  src/messages/control.cpp
  src/messages/memory/inference_memory_fil.cpp
  src/messages/memory/inference_memory_nlp.cpp
  src/messages/memory/inference_memory.cpp
  src/messages/memory/inference_memory.cpp
  src/messages/memory/response_memory_probs.cpp
  src/messages/memory/response_memory.cpp
  src/messages/memory/tensor_memory.cpp
  src/messages/meta.cpp
  src/messages/multi_inference_fil.cpp
  src/messages/multi_inference_nlp.cpp
  src/messages/multi_inference.cpp
  src/messages/multi_response_probs.cpp
  src/messages/multi_response.cpp
  src/messages/multi_tensor.cpp
  src/messages/multi.cpp
  src/modules/data_loader_module.cpp
  src/modules/llm_engine_module.cpp
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
  src/objects/tensor_object.cpp
  src/objects/tensor.cpp
  src/objects/wrapped_tensor.cpp
  src/stages/add_classification.cpp
  src/stages/add_scores_stage_base.cpp
  src/stages/add_scores.cpp
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
  src/utilities/caching_util.cpp
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
    matx::matx
  PUBLIC
    $<TARGET_NAME_IF_EXISTS:conda_env>
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

# Add the include directories of the cudf_helpers_project since we dont want to link directly to it
get_target_property(cudf_helpers_include ${cudf_helpers_target} INTERFACE_INCLUDE_DIRECTORIES)

target_include_directories(morpheus
  PRIVATE
    ${cudf_helpers_include}
)

# Also add a dependency to the target so that the headers are generated before the target is built
add_dependencies(morpheus ${cudf_helpers_target})

# In debug mode, dont allow missing symbols
target_link_options(morpheus PUBLIC "$<$<CONFIG:Debug>:-Wl,--no-allow-shlib-undefined>")

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
    BASE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/include"
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

if(MORPHEUS_PYTHON_INPLACE_BUILD)
  morpheus_utils_inplace_build_copy(morpheus ${CMAKE_CURRENT_SOURCE_DIR})
endif()

# ##################################################################################################
# - install targets --------------------------------------------------------------------------------

# Get the library directory in a cross-platform way
rapids_cmake_install_lib_dir(lib_dir)

include(CPack)
include(GNUInstallDirs)

install(
    TARGETS
      morpheus
    EXPORT
      ${PROJECT_NAME}-core-exports
    LIBRARY
    DESTINATION ${lib_dir}
    FILE_SET
      public_headers
)

# ##################################################################################################
# - install export ---------------------------------------------------------------------------------
set(doc_string
    [=[
Provide targets for mrc.
]=])

set(rapids_project_version_compat SameMinorVersion)

# Install cmake helper scripts needed to build examples
set(cmake_lib_dir "${lib_dir}/cmake/morpheus")

install(DIRECTORY
  "${MORPHEUS_UTILS_ROOT_PATH}"
  DESTINATION "${cmake_lib_dir}"
)

set(code_string
    [=[
if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/morpheus_utils/load.cmake")
  include("${CMAKE_CURRENT_LIST_DIR}/morpheus_utils/load.cmake")
endif()
]=])

# Need to explicitly set VERSION ${PROJECT_VERSION} here since rapids_cmake gets
# confused with the `RAPIDS_VERSION` variable we use
rapids_export(INSTALL ${PROJECT_NAME}
    EXPORT_SET ${PROJECT_NAME}-core-exports
    GLOBAL_TARGETS morpheus
    VERSION ${PROJECT_VERSION}
    NAMESPACE morpheus::
    DOCUMENTATION doc_string
    FINAL_CODE_BLOCK code_string
)

# ##################################################################################################
# - build export ----------------------------------------------------------------------------------
rapids_export(BUILD ${PROJECT_NAME}
    EXPORT_SET ${PROJECT_NAME}-core-exports
    GLOBAL_TARGETS morpheus
    VERSION ${PROJECT_VERSION}
    LANGUAGES C CXX CUDA
    NAMESPACE morpheus::
    DOCUMENTATION doc_string
    FINAL_CODE_BLOCK code_string
)
