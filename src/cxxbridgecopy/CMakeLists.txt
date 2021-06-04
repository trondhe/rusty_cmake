add_library(mycxxbridge)

target_sources(mycxxbridge
    PRIVATE
        lib.rs.cc
)

target_include_directories(mycxxbridge
    PUBLIC
        .
)
