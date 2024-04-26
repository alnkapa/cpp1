cmake_minimum_required(VERSION 3.25.1)

project(helloworld VERSION 0.0.1)

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
SET(CPACK_DEBIAN_PACKAGE_NAME ${PROJECT_NAME}) 
SET(CPACK_DEBIAN_PACKAGE_VERSION ${PROJECT_VERSION})
IF(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64")
    SET(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64") 
ELSE()
    message(FATAL_ERROR "Unknown System Architecture: ${CMAKE_SYSTEM_PROCESSOR}")
ENDIF()
SET(CPACK_DEBIAN_PACKAGE_DEPENDS "No") 
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "MAINTAINER") 
SET(CPACK_DEBIAN_PACKAGE_DESCRIPTION "home work 1") 

INCLUDE(CPack)