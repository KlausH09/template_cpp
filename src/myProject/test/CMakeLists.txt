set(Target myProjectTests)

add_executable(${Target}
    test_foo.cpp
)

target_link_libraries(${Target} PRIVATE
  myProject
)

#target_compile_definitions(${Target}
#        PRIVATE TEST_FILES_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")

target_compile_options(${Target} PRIVATE
  $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>
  $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -pedantic -Werror>
)

add_khTest(${Target})
