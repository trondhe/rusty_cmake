// #include "lib.rs.h"
#include <iostream>

extern "C" {

int32_t rusty_c_integer();
}

int main() {
  std::cout << "Hello!\n";
  // std::cout << rusty_integer();
  std::cout << "direct extern c function from rust with value: "
            << rusty_c_integer() << "\n";
  return 0;
}
