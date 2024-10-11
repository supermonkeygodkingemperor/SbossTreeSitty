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
add_subdirectory(xenia/src/xenia)

# Find all source files in the xenia/src/xenia directory and its subdirectories
file(GLOB_RECURSE XENIA_SOURCES "xenia/src/xenia/*.cpp" "xenia/src/xenia/**/*.cpp" "xenia/src/xenia/**/*.c")

# Define the main library
add_library(xenia SHARED ${XENIA_SOURCES})

target_link_libraries(xenia
        # Link with system libraries
        android
        log
        GLESv2
        OpenSLES

        # Link with Xenia dependencies (replace with actual paths if needed)
        # Example for libavcodec:
        ${LIBAVCODEC_LIBRARY} # Assuming you found it using find_library
        # ... other dependencies (libavformat, zlib, libpng, libjpeg-turbo, FreeType)
        # Follow similar patterns for other libraries
)

# Set the target ABI
set_target_properties(xenia PROPERTIES
    ANDROID_ABI ${ANDROID_ABI}
)

# Set the library output directory
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/jniLibs/${ANDROID_ABI})

# Add any additional build flags or configurations as needed
# For example, you might need to define preprocessor macros or include additional directories.