
function(add_rust_lib path)
    # set(OPTIONS)
    # set(ONE_VALUE_KEYWORDS)
    # set(MULTI_VALUE_KEYWORDS)
    # cmake_parse_arguments(ADD_RUST_LIB "${OPTIONS}" "${ONE_VALUE_KEYWORDS}" "${MULTI_VALUE_KEYWORDS}" ${ARGN})
    # set(RUST_LIB_SRC_DIR ${ARG0})


    if(NOT EXISTS "${CMAKE_CURRENT_LIST_DIR}/${path}/Cargo.toml")
        message(FATAL_ERROR "The path ${CMAKE_CURRENT_LIST_DIR}/${path} does not contain a Cargo.toml")
    endif()

    corrosion_import_crate(MANIFEST_PATH "${path}/Cargo.toml")
endfunction(add_rust_lib)
