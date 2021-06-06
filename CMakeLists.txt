cmake_minimum_required(VERSION 3.16)

set(CMAKE_EXPORT_COMPILE_COMMANDS true)

project(rusty_cmake CXX)
include(cmake/corrosion_cxx.cmake)
add_subdirectory(thirdparty/corrosion)

add_subdirectory(src)
