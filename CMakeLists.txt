cmake_minimum_required(VERSION 3.23)

project(rusty_cmake CXX)

include(FetchContent)

set(CMAKE_EXPORT_COMPILE_COMMANDS true)
set(CMAKE_CXX_STANDARD 17)

FetchContent_Declare(
    Corrosion
    GIT_REPOSITORY https://github.com/corrosion-rs/corrosion.git
    GIT_TAG master
)
FetchContent_MakeAvailable(Corrosion)

find_program(CXXBRIDGE cxxbridge PATHS "$ENV{HOME}/.cargo/bin/")
if (CXXBRIDGE STREQUAL "CXXBRIDGE-NOTFOUND")
    message("Could not find cxxbridge, trying to install with `cargo install cxxbridge-cmd'")
    find_program(CARGO cargo PATHS "$ENV{HOME}/.cargo/bin/")
    if (CARGO STREQUAL "CARGO-NOTFOUND")
        message(FATAL_ERROR "Requires cargo available in path, install via rustup https://rustup.rs/")
    endif()
    execute_process(COMMAND ${CARGO} install cxxbridge-cmd)
    find_program(CXXBRIDGE cxxbridge PATHS "$ENV{HOME}/.cargo/bin/")
endif()

add_subdirectory(src)
