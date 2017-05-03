cmake_minimum_required(VERSION 3.7)

# This target might be included by another project.
#if(NOT CMAKE_PROJECT_NAME OR "${CMAKE_PROJECT_NAME}" STREQUAL "c2r2")
project(c2r2 CXX)
#endif()

set(CMAKE_CXX_STANDARD 11)

set(C2R2_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE PATH "Location of 'C2R2'")

### ANTLR4 ###
# Point cmake to the antlr4 CMake module.
list(APPEND CMAKE_MODULE_PATH ${C2R2_DIR}/cmake )
# set variable pointing to the antlr tool that supports C++
set(ANTLR4CPP_JAR_LOCATION /usr/local/Cellar/antlr/4.7/antlr-4.7-complete.jar)
# add external build for antlrcpp
include( ExternalAntlr4Cpp )
# add antrl4cpp artifacts to project environment
include_directories( ${ANTLR4CPP_INCLUDE_DIRS} )
link_directories( ${ANTLR4CPP_LIBS} )
message(STATUS "Found antlr4cpp libs: ${ANTLR4CPP_LIBS} and includes: ${ANTLR4CPP_INCLUDE_DIRS} ")

# Call macro to add lexer and grammar to your build dependencies.
antlr4cpp_process_grammar(c2r2 c2r2
        ${C2R2_DIR}/src/C2R2Lexer.g4
        ${C2R2_DIR}/src/C2R2Parser.g4)
# include generated files in project environment
include_directories(${antlr4cpp_include_dirs_c2r2})
### END ANTLR4 ###


if(NOT DEFINED C2R2_LINK_MODE)
    set(C2R2_LINK_MODE STATIC)
endif()

#set(C2R2_SOURCE_FILES )

add_library(c2r2 ${C2R2_LINK_MODE} ${antlr4cpp_src_files_c2r2})
#target_sources(c2r2 PUBLIC )
#target_sources(c2r2 PUBLIC ${C2R2_SOURCE_FILES})
add_dependencies(c2r2 antlr4cpp antlr4cpp_generation_c2r2)
target_link_libraries(c2r2 ${ANTLR4CPP_LIBS}/libantlr4-runtime.a)

add_executable(c2r2test src/main.cpp)
add_dependencies(c2r2test c2r2)
target_link_libraries(c2r2test c2r2 ${ANTLR4CPP_LIBS}/libantlr4-runtime.a)