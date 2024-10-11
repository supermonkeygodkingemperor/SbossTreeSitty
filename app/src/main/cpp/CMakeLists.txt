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

# Find Vulkan
find_package(Vulkan REQUIRED)

# Link with libraries
target_link_libraries( # Specifies the target library.
        xenia
        # Links the target library to the log library.
        log 
        # Links the target library to the android library.
        android
        # Links the target library to the GLESv2 library.
        GLESv2
        # Links the target library to the OpenSLES library.
        OpenSLES
        # Links the target library to the avcodec library.
        avcodec
        # Links the target library to the avformat library.
        avformat
        # Links the target library to the z library.
        z
        # Links the target library to the png16 library.
        png16
        # Links the target library to the jpeg library.
        jpeg
        # Links the target library to the freetype library.
        freetype
        # Links the target library to the Vulkan library.
        Vulkan::Vulkan
)

# Set the target ABI
set_target_properties(xenia PROPERTIES
    ANDROID_ABI ${ANDROID_ABI}
)

# Set the library output directory
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/jniLibs/${ANDROID_ABI})

# Add any additional build flags or configurations as needed
# For example, you might need to define preprocessor macros or include additional directories.