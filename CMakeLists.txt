cmake_minimum_required(VERSION 3.16)

# add_compile_definitions(_ITERATOR_DEBUG_LEVEL=0)
# add_compile_options(-nodefaultlibs)
# add_link_options(-lmsvcrt.lib -lvcruntime.lib -lucrt.lib)
project(rusty_cmake CXX)
include(cmake/corrosion_cxx.cmake)
add_subdirectory(thirdparty/corrosion)

add_subdirectory(src)
