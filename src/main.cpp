// #include "lib.rs.h"
#include <iostream>

extern ::std::int32_t rusty_integer() noexcept;

extern "C" {

int32_t rusty_c_integer();
}

int main() {
  std::cout << "Hello!\n";
  // std::cout << rusty_integer(); // Uncomment here to get the linker error
  std::cout << "direct extern c function from rust with value: "
            << rusty_c_integer() << "\n";
  return 0;
}
