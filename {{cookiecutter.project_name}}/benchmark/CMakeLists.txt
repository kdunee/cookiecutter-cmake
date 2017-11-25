find_package(Benchmark REQUIRED)

include_directories(${Benchmark_INCLUDE_DIRS})

add_executable(benchmark benchmark.cpp)
target_link_libraries(benchmark ${Benchmark_LIBRARIES}
  ${CMAKE_THREAD_LIBS_INIT}
  ${CMAKE_PROJECT_NAME})
