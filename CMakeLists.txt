cmake_minimum_required(VERSION 3.25.1)

set(PATCH_VERSION "2" CACHE INTERNAL "Patch version")
set(PROJECT_VESRION 0.0.${PATCH_VERSION})

project(helloworld VERSION ${PROJECT_VESRION})

add_executable(helloworld_cli main.cpp)

configure_file(version.h.in version.h)

target_include_directories(
    helloworld_cli
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
)

include(FetchContent)
FetchContent_Declare(
  googletest
  # Specify the commit you depend on and update it regularly.
  URL https://github.com/google/googletest/archive/5376968f6948923e2411081fd9372e71a59d8e77.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Now simply link against gtest or gtest_main as needed. Eg
add_executable(test_version test_version.cpp)

set_target_properties(test_version PROPERTIES
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED ON
)

target_include_directories(test_version PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
target_link_libraries(test_version gtest_main)
enable_testing()
add_test(test_version test_version)

install(
    TARGETS helloworld_cli
    COMPONENT ${PROJECT_NAME}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} # bin
)

SET(CPACK_GENERATOR "DEB")
SET(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR}) 
SET(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR}) 
SET(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH}) 
SET(CPACK_PACKAGE_NAME ${CMAKE_PROJECT_NAME})
SET(CPACK_PACKAGE_CONTACT "my")
INCLUDE(CPack)

