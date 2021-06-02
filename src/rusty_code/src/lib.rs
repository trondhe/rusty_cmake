#[cxx::bridge]
mod ffi {
    extern "Rust" {
        fn rusty_integer() -> i32;
    }
}

pub fn rusty_integer() -> i32 {
    42
}

#[test]
fn it_works() {
    assert!(rusty_integer() == 42);
}
