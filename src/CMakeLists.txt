add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
    PRIVATE
        main.cpp
)

add_library_rust(PATH rusty_code NAMESPACE my)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
        my::rusty_code
)
