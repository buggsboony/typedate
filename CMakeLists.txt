cmake_minimum_required(VERSION 3.0)

project(typedate)

add_executable(typedate typedate_main.cpp)
target_link_libraries(typedate X11 Xtst)
install(TARGETS typedate RUNTIME DESTINATION bin)
