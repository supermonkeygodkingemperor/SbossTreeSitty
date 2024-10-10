cmake
cmake_minimum_required(VERSION 3.4.1)

# Project name
project(xenia-android)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find and include the Android NDK
find_package(Android NDK REQUIRED)
include_directories(${ANDROID_NDK_INCLUDE_DIRS})

# Add the Xenia source directory
add_subdirectory(xenia)

# Find all source files in the xenia/src directory and its subdirectories
file(GLOB_RECURSE XENIA_SOURCES "xenia/src/*.cpp" "xenia/src/**/*.cpp")

# Define the main library
add_library(xenia SHARED ${XENIA_SOURCES})

# Link with necessary libraries
target_link_libraries(xenia
    # Link with system libraries
    android
    log
    # ... other libraries, e.g., OpenGL ES, OpenSL ES
)

# Set the target ABI
set_target_properties(xenia PROPERTIES
    ANDROID_ABI ${ANDROID_ABI}
<<<<<<< Updated upstream
)
=======
)
>>>>>>> Stashed changes
