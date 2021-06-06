
# Creates a target including rust lib and cxxbridge named ${NAMESPACE}::${LAST STEM OF PATH}
# <LAST STEM OF PATH> must match the crate name ie "some/path/to/myrustcrate" -> "libmyrustcrate.a"
function(add_rust_lib)
    # set(OPTIONS)
    set(ONE_VALUE_KEYWORDS PATH NAMESPACE)
    # set(MULTI_VALUE_KEYWORDS)
    cmake_parse_arguments(ADD_RUST_LIB "${OPTIONS}" "${ONE_VALUE_KEYWORDS}" "${MULTI_VALUE_KEYWORDS}" ${ARGN})


    ### Check inputs
    if("${ADD_RUST_LIB_PATH}" STREQUAL "")
        message(FATAL_ERROR "add_rust_lib called without a given path to root of a rust crate, fix by adding 'PATH <pathToRustlibRoot>'")
    endif()

    if("${ADD_RUST_LIB_NAMESPACE}" STREQUAL "")
        message(FATAL_ERROR "Must supply a namespace given by keyvalue NAMESPACE <value>")
    endif()

    if(NOT EXISTS "${CMAKE_CURRENT_LIST_DIR}/${ADD_RUST_LIB_PATH}/Cargo.toml")
        message(FATAL_ERROR "The path ${CMAKE_CURRENT_LIST_DIR}/${ADD_RUST_LIB_PATH} does not contain a Cargo.toml")
    endif()

    ## Simplyfy inputs
    set(_LIB_PATH ${ADD_RUST_LIB_PATH})
    set(_NAMESPACE ${ADD_RUST_LIB_NAMESPACE})


    ## Import Rust target
    corrosion_import_crate(MANIFEST_PATH "${_LIB_PATH}/Cargo.toml")

    ## Set cxxbridge values
    cmake_path(GET _LIB_PATH STEM _LIB_PATH_STEM)
    set(CXXBRIDGE_BINARY_FOLDER ${CMAKE_BINARY_DIR}/cargo/build/${Rust_TOOLCHAIN}/cxxbridge) 
    set(COMMON_HEADER ${CXXBRIDGE_BINARY_FOLDER}/rust/cxx.h)
    set(BINDING_HEADER ${CXXBRIDGE_BINARY_FOLDER}/${_LIB_PATH_STEM}/src/lib.rs.h)
    set(BINDING_SOURCE ${CXXBRIDGE_BINARY_FOLDER}/${_LIB_PATH_STEM}/src/lib.rs.cc)
    set(CXX_BINDING_INCLUDE_DIR ${CXXBRIDGE_BINARY_FOLDER})

    ## Create cxxbridge target
    add_custom_command(
        DEPENDS ${_LIB_PATH_STEM}-static
        OUTPUT
            ${COMMON_HEADER}
            ${BINDING_HEADER}
            ${BINDING_SOURCE} 
    )

    add_library(${_LIB_PATH_STEM}_cxxbridge)
    target_sources(${_LIB_PATH_STEM}_cxxbridge
        PUBLIC
            ${COMMON_HEADER}
            ${BINDING_HEADER}
            ${BINDING_SOURCE}
    )
    target_include_directories(${_LIB_PATH_STEM}_cxxbridge
        PUBLIC
            ${CXX_BINDING_INCLUDE_DIR}
    )

    ## Create total target with alias with given namespace
    add_library(${_LIB_PATH}-total INTERFACE)
    target_link_libraries(${_LIB_PATH}-total
        INTERFACE
            ${_LIB_PATH_STEM}_cxxbridge
            ${_LIB_PATH}
    )
    # for end-user to link into project
    add_library(${_NAMESPACE}::${_LIB_PATH} ALIAS ${_LIB_PATH}-total)
    
endfunction(add_rust_lib)
