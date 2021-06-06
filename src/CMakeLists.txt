add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
    PRIVATE
        main.cpp
)

set(Rust_TOOLCHAIN "x86_64-pc-windows-gnu")
add_rust_lib(PATH rusty_code NAMESPACE my)


target_link_libraries(${PROJECT_NAME}
    PUBLIC
        my::rusty_code
)
