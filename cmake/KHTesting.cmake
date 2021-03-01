# options
option(Build_Tests "build tests" OFF)
option(Linting "enable linting" OFF)
option(MemCheck "enable checking for memory leaks" OFF)
option(CodeCov "enable code coverage" OFF)

if(Build_Tests)
  find_package(Catch2 REQUIRED)
  include(CTest)
  include(Catch)
endif(Build_Tests)



# linting
if(Linting)
  set(CMAKE_CXX_CLANG_TIDY 
    clang-tidy;
    -checks=*,-modernize-use-trailing-return-type,-fuchsia-default-arguments-calls;
    -warnings-as-errors=*
  )
  #set(CMAKE_CXX_CLANG_TIDY clang-tidy -checks=-*,readability-*)
endif(Linting)

# memory leaks
if(MemCheck)
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(MEMORYCHECK_COMMAND_OPTIONS "--leak-check=full --error-exitcode=100")
    # set(MEMORYCHECK_SUPPRESSIONS_FILE "/path/to/valgrind.suppressions")

    add_custom_target(memcheck
        COMMAND ctest -T memcheck
        WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
        COMMENT "run valgrind on tests"
    )
    add_custom_command(TARGET memcheck POST_BUILD
        COMMAND ;
        COMMENT "finished memcheck"
    )
  else()
    message(WARNING "memcheck: unsupported compiler ${CMAKE_CXX_COMPILER_ID}")
  endif()
endif(MemCheck)

# code coverage
if(CodeCov)
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    include("${CMAKE_CURRENT_LIST_DIR}/CodeCoverage.cmake")
    APPEND_COVERAGE_COMPILER_FLAGS()
    setup_target_for_coverage_lcov(
      NAME coverage
      EXECUTABLE ctest
      EXCLUDE
        "/usr/*"
      )
  else()
    message(WARNING "code coverage: unsupported compiler ${CMAKE_CXX_COMPILER_ID}")
  endif()
endif()

# main test file (comiled only once)
set(mainKHTest mainKHTest)
add_library(${mainKHTest} STATIC ${CMAKE_CURRENT_LIST_DIR}/mainKHTest.cpp)
target_link_libraries(${mainKHTest} PRIVATE Catch2::Catch2)
set_target_properties(${mainKHTest} PROPERTIES CXX_CLANG_TIDY "")

# add tests
function(add_khTest TEST_EXE)
  target_link_libraries(${TEST_EXE} PRIVATE Catch2::Catch2 ${mainKHTest})
  set_target_properties(${TEST_EXE} PROPERTIES CXX_CLANG_TIDY "")
  catch_discover_tests(${TEST_EXE})
endfunction()
