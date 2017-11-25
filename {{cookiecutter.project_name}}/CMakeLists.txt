cmake_minimum_required(VERSION 3.5)

project({{cookiecutter.project_name}}
  VERSION 1.0.0
  LANGUAGES C CXX)

include(common_setup.cmake)

add_library(${CMAKE_PROJECT_NAME} code.cpp)
find_package(Threads REQUIRED)
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
