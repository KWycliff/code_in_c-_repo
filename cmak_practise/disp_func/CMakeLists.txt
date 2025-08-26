
add_library(lib 
            src/disp_func/display_func.h 
            src/disp_func/display_func.c)

target_include_directories(lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src ) # list of directories 
# CMAKE_CURRENT_SOURCE_DIR this is the path of the currently processed cmake file 


