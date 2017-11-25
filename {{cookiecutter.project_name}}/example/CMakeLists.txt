add_executable(example example.cpp)
target_link_libraries(example ${CMAKE_PROJECT_NAME}
  ${CMAKE_THREAD_LIBS_INIT})
