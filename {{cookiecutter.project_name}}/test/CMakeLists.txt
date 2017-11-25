find_package(GTest REQUIRED)

set(TEST_SOURCES test.cpp)
add_executable(tests ${TEST_SOURCES})
target_link_libraries(tests GTest::GTest
  GTest::Main
  ${CMAKE_PROJECT_NAME}
  ${CMAKE_THREAD_LIBS_INIT})

GTEST_ADD_TESTS(tests "" ${TEST_SOURCES})
