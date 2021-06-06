#[cxx::bridge]
mod ffi {
    extern "Rust" {
        fn rusty_cxxbridge_integer() -> i32;
    }
}

pub fn rusty_cxxbridge_integer() -> i32 {
    42
}

#[no_mangle]
pub extern "C" fn rusty_extern_c_integer() -> i32 {
    322
}
