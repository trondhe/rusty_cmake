# Rusty cmake

Integrate Rust in a Cmake project with [Corrosion](https://github.com/AndrewGaspar/corrosion) and [Cxx](https://github.com/dtolnay/cxx).

## Usage

`Rust_CARGO_TARGET` needs to be defined before calling `add_library_rust`, which takes a `PATH` to the root of a rust crate along with a required `NAMESPACE` to use for the created target.  
`add_library_rust(PATH some/path/to/rustycrate NAMESPACE my)` will result in a target `my::rustycrate` that includes both the crate itself and the generated cxxbridge header and source to be linked into another target.

## Windows + Clang issue

Building with Clang on Windows in debug mode creates a mismatch between the c runtime being dynamic release for the rust lib and dynamic debug for cpp code.
No clean solution have been found to this issue. Using the -gnu target on Windows for the Rust lib and building with mingw bypasses this.

## Other notes

- This has only been tested with calling Rust from Cpp, and not the other way around.
- For some reason the `lib.rs.cpp' file gets compliled twice, not sure why.
- Clean up how the bindings are placed `#include "rustycrate/src/lib.rs.h"` is a bit ugly.
