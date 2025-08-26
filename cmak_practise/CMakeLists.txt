# TODO 1: Set the minimum required version of CMake to be 3.10
cmake_minimum_required(VERSION 3.12)


# TODO 2: Create a project named Tutorial

project(Tutorial)

add_subdirectory(main_prog)
add_subdirectory(disp_func)

# TODO 7: Set the project version number as 1.0 in the above project command

# TODO 6: Set the variable CMAKE_CXX_STANDARD to 11
#         and the variable CMAKE_CXX_STANDARD_REQUIRED to True

# TODO 8: Use configure_file to configure and copy TutorialConfig.h.in to
#         TutorialConfig.h
#add_library(lib 
#            display_func.h 
#            display_func.c)




# TODO 3: Add an executable called Tutorial to the project
#add_executable(Tutorial array_pointers.c)

#target_link_libraries(Tutorial PUBLIC lib)


# Hint: Be sure to specify the source file as tutorial.cxx

# TODO 9: Use target_include_directories to include ${PROJECT_BINARY_DIR}