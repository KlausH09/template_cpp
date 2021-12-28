cmake_minimum_required(VERSION 3.5)

project(CppExampleProject) # FIXME

add_subdirectory(extern/catch2)
include(cmake/KHTesting.cmake)

function(addCompileOptions target)
  target_compile_features(${target} PRIVATE cxx_std_17) # FIXME
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
