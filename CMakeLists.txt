cmake_minimum_required(VERSION 3.20)

project(rusty_cmake CXX)

include(cmake/corrosion_cxx.cmake)
add_subdirectory(thirdparty/corrosion)

add_subdirectory(src)
