set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include_directories(${CMAKE_SOURCE_DIR})

set(COMPILER_WARNINGS_FLAGS "-Wall -Wextra -Werror")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMPILER_WARNINGS_FLAGS} -std=c11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILER_WARNINGS_FLAGS} -std=c++14")
  
option(USE_ASAN "use address sanitizer" OFF)
if(USE_ASAN)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=address")
  if("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
    set(CMAKE_LINKER_FLAGS "${CMAKE_LINKER_FLAGS} -lasan")
  endif()
endif()

if("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
  option(USE_TSAN "use thread sanitizer" OFF)
  if(USE_TSAN)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=thread")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=thread")
  endif()
endif()

option(KEEP_FRAME "keep frame pointer" OFF)
if(KEEP_FRAME)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-omit-frame-pointer")
endif()

option(BUILD_SHARED_LIBS "build shared libraries" ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()