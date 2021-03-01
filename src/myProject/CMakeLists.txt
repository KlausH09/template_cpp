set(Target myProject)

add_library(${Target} STATIC
    foo.cpp
)

target_include_directories(${Target}
    PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>/include/
)

addCompileOptions(${Target})

if(Build_Tests)
   add_subdirectory(test)
endif()
