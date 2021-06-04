
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

    # cmake_path(GET path STEM RUSTLIB_PROJECTFOLDER_NAME)

    # set(RUST_TARGET_TRIPLE "x86_64-pc-windows-msvc")

    # set(CXXBRIDGE_BINARY_FOLDER ${CMAKE_BINARY_DIR}/cargo/build/${RUST_TARGET_TRIPLE}/cxxbridge) 

    # set(CXX_COMMON_HEADER ${CXXBRIDGE_BINARY_FOLDER}/rust/cxx.h)
    # set(CXX_BINDING_HEADER ${CXXBRIDGE_BINARY_FOLDER}/rusty_code/src/lib.rs.h)
    # set(CXX_BINDING_SOURCE ${CXXBRIDGE_BINARY_FOLDER}/rusty_code/src/lib.rs.cc)
    
    # set(CXX_BINDING_INCLUDE_DIR ${CXXBRIDGE_BINARY_FOLDER})

    # add_custom_command(
    #     OUTPUT 
    #         ${CXX_COMMON_HEADER}
    #         ${CXX_BINDING_HEADER}
    #         ${CXX_BINDING_SOURCE}
    #     DEPENDS rusty_code
    # )

    # add_library(rust_code_cxxbridge)
    # target_sources(rust_code_cxxbridge
    #     PUBLIC
    #         ${CXX_COMMON_HEADER}
    #         ${CXX_BINDING_HEADER}
    #         ${CXX_BINDING_SOURCE}
    # )
    # target_include_directories(rust_code_cxxbridge
    #     PUBLIC
    #         ${CXX_BINDING_INCLUDE_DIR}
    # )
    
endfunction(add_rust_lib)
