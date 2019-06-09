cmake_minimum_required(VERSION 3.11)

project({{cookiecutter.project_name}}
  VERSION 1.0.0
  LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(COMPILER_WARNINGS_FLAGS "-Wall -Wextra -pedantic")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMPILER_WARNINGS_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILER_WARNINGS_FLAGS}")

include(commons.cmake.in)

add_library(${CMAKE_PROJECT_NAME} code.cpp)
find_package(Threads)
target_link_libraries(${CMAKE_PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})

option(BUILD_BENCHMARK "build benchmarks" OFF)
if(BUILD_BENCHMARK)
  add_subdirectory(benchmark)
endif()

option(BUILD_TEST "build tests" ON)
if(BUILD_TEST)
  enable_testing()
  add_subdirectory(test)
endif()

option(BUILD_EXAMPLE "build examples" OFF)
if(BUILD_EXAMPLE)
  add_subdirectory(example)
endif()
