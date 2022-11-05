corrosion_import_crate(MANIFEST_PATH rusty_code/Cargo.toml)
corrosion_add_cxxbridge(rusty_bridge CRATE rusty_code MANIFEST_PATH rusty_code FILES lib.rs)

add_executable(rusty_cmake main.cpp)
target_link_libraries(rusty_cmake PRIVATE rusty_bridge)
