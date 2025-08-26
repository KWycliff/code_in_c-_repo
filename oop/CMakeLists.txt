
cmake_minimum_required(VERSION 3.12)

project(inheritence)

add_subdirectory(components)

add_executable(main main.c)

target_link_libraries(main PUBLIC lib)