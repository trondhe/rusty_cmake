cmake_minimum_required(VERSION 3.16)

set(CMAKE_EXPORT_COMPILE_COMMANDS true)

project(rusty_cmake CXX)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
    set(Rust_TOOLCHAIN "x86_64-pc-windows-gnu")
elseif("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
    set(Rust_TOOLCHAIN "x86_64-unknown-linux-gnu")
else()
    message(FATAL_ERROR "hardcoded platformchecks not supported outside windows-gnu and linux-gnu")
endif()

include(cmake/corrosion_cxx.cmake)
add_subdirectory(thirdparty/corrosion)

add_subdirectory(src)
