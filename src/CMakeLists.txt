add_executable(${PROJECT_NAME})

# set_property(TARGET ${PROJECT_NAME} PROPERTY
#   MSVC_RUNTIME_LIBRARY "MultiThreadedDLL$<$<CONFIG:Debug>:Debug>")

target_sources(${PROJECT_NAME}
    PRIVATE
        main.cpp
)

add_rust_lib(rusty_code)

add_subdirectory(cxxbridgecopy)


target_link_libraries(${PROJECT_NAME}
    PUBLIC
        rusty_code
        # rust_code_cxxbridge
        mycxxbridge
)
