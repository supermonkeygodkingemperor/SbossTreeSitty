cmake
cmake_minimum_required(VERSION 3.18.1)

project(xenia-android)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find and include the Android NDK
find_package(Android NDK REQUIRED)
include_directories(${ANDROID_NDK_INCLUDE_DIRS})

# Add the Xenia source directory
add_subdirectory(xenia)

# Find all source files in the xenia/src/xenia directory and its subdirectories
file(GLOB_RECURSE XENIA_SOURCES "xenia/src/xenia/*.cpp" "xenia/src/xenia/**/*.cpp" "xenia/src/xenia/**/*.c")

# Define the main library
add_library(xenia SHARED ${XENIA_SOURCES})

# Link with necessary libraries
target_link_libraries(xenia
        # Link with system libraries
        android
        log
        # ... other libraries, e.g., OpenGL ES, OpenSL ES
        GLESv2
        OpenSLES
        # Add any other required libraries here, e.g., libavcodec, libavformat, etc.
        # You might need to find these libraries using find_library() if they are not system libraries.
)

# Set the target ABI
set_target_properties(xenia PROPERTIES
        ANDROID_ABI ${ANDROID_ABI}
)

# Set the library output directory
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/jniLibs/${ANDROID_ABI})

# Add any additional build flags or configurations as needed
# For example, you might need to define preprocessor macros or include additional directories.