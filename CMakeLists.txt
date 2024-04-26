cmake_minimum_required(VERSION 3.25.1)

project(Task VERSION 0.0.1)
# VERSION <major>[.<minor>[.<patch>[.<tweak>]

add_executable(helloworld_cli main.cpp)

configure_file(version.h.in version.h)

target_include_directories(
    helloworld_cli
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
)