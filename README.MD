# Rusty cmake

Integrate Rust in a Cmake project with [Corrosion](https://github.com/AndrewGaspar/corrosion) and [Cxx](https://github.com/dtolnay/cxx).

This has now been updated with using `corrosion_add_cxxbridge` function from corrosion, removing the need for external cmake scripts, making the setup much simpler

To build and run do

configure:  
`cmake --preset default`

build:  
`cmake --build --preset default`

run:  
`build/default/src/rusty_cmake`
