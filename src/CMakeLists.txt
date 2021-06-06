add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
    PRIVATE
        main.cpp
)

set(Rust_TOOLCHAIN "x86_64-pc-windows-gnu")
add_rust_lib(rusty_code)

# add_subdirectory(cxxbridgecopy)


target_link_libraries(${PROJECT_NAME}
    PUBLIC
        rusty_code
        rusty_code_cxxbridge
)
