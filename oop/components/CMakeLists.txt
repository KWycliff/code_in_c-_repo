
add_library(
    lib 
    shape.h
    shape.c
    rectangle.h
    rectangle.c 
)

target_link_libraries(lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})