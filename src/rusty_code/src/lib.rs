#[cxx::bridge]
mod ffi {
    extern "Rust" {
        fn rusty_integer() -> i32;
    }
}

pub fn rusty_integer() -> i32 {
    42
}

#[no_mangle]
pub extern "C" fn rusty_c_integer() -> i32 {
    322
}

#[test]
fn it_works() {
    assert!(rusty_integer() == 42);
}
