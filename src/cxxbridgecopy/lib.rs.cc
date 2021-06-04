#include <cstdint>

extern "C" {
::std::int32_t cxxbridge1$rusty_integer() noexcept;
} // extern "C"

::std::int32_t rusty_integer() noexcept {
  return cxxbridge1$rusty_integer();
}
