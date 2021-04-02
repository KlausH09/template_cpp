cmake_minimum_required(VERSION 3.5)

project(CppExampleProject) # FIXME
set(CMAKE_CXX_STANDARD 17) # FIXME
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(cmake/KHTesting.cmake)

function(addCompileOptions target)
  target_compile_options(${target} PRIVATE
    $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>
    $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -pedantic -Werror>
  )
  if(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_options(${target} PRIVATE
      $<$<CXX_COMPILER_ID:MSVC>:/Ox>
      $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Ofast>
    )
  endif()
endfunction(addCompileOptions target)


add_subdirectory(src/myProject)
