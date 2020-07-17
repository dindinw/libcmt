cmake_minimum_required(VERSION 3.9)

set(CMAKE_BUILD_TYPE Debug)

project(cmt VERSION 1.0.1 DESCRIPTION "C Metal Wrapper"
            LANGUAGES C OBJC)

execute_process(COMMAND xcrun -sdk macosx --show-sdk-path OUTPUT_VARIABLE SDK_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)

message(STATUS "sdk path: ${SDK_PATH}")
set(CMAKE_OSX_SYSROOT ${SDK_PATH})

#string(APPEND  SDK_PATH "/System/Library/Frameworks/")
#message(STATUS "sdk path: ${SDK_PATH}")

find_library(FOUNDATION_LIBRARY Foundation)
#find_library(FOUNDATION_LIBRARY Foundation PATHS ${SDK_PATH} NO_DEFAULT_PATH)
find_library(METAL_LIBRARY Metal)
#find_library(METAL_LIBRARY Metal PATHS ${SDK_PATH} NO_DEFAULT_PATH)
MARK_AS_ADVANCED(FOUNDATION_LIBRARY
                     METAL_LIBRARY)

message(STATUS "Foundation lib: ${FOUNDATION_LIBRARY}")
message(STATUS "Metal lib: ${METAL_LIBRARY}")

set(SOURCES
    src/reflection/argument.m
    src/reflection/pointer_type.m
    src/reflection/descriptor.m
    src/compute/compute-pipeline.m
    src/kernels/attribute.m
    src/kernels/attribute_vertex.m
    src/kernels/constant_values.m
    src/kernels/compile-opts.m
    src/kernels/function.m
    src/kernels/library.m
    src/memory/buffer.m
    src/memory/heap-descriptor.m
    src/memory/heap.m
    src/memory/vertex.m
    src/rendering/depthstencil.m
    src/rendering/rpass.m
    src/rendering/rpip.m
    src/argument_descriptor.m
    src/argument_encoder.m
    src/cmt.m
    src/command_buf.m
    src/command_buf_indirect.m
    src/command_queue.m
    src/command_enc.m
    src/command_enc_render.m
    src/command_enc_compute.m
    src/command_enc_blit.m
    src/device.m
    src/error.m
    src/event.m
    src/resource.m)

add_library(cmt STATIC ${SOURCES})

target_include_directories(cmt PRIVATE .)
target_include_directories(cmt PRIVATE include/)
target_include_directories(cmt INTERFACE include/)

set_target_properties(cmt PROPERTIES
                        VERSION ${PROJECT_VERSION}
                        SOVERSION 1
                        PUBLIC_HEADER include/cmt/cmt.h)


target_link_libraries(cmt ${FOUNDATION_LIBRARY} ${METAL_LIBRARY})

#configure_file(mylib.pc.in mylib.pc @ONLY)

#include(GNUInstallDirs)

#install(TARGETS mylib
#    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

#install(FILES ${CMAKE_BINARY_DIR}/mylib.pc
#    DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig)
