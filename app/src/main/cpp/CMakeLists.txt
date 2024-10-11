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

# Set the JNI_LIBS_DIR variable
set(JNI_LIBS_DIR ${CMAKE_SOURCE_DIR}/app/src/main/jniLibs)

# Set the search path for find_library
list(APPEND CMAKE_FIND_ROOT_PATH ${JNI_LIBS_DIR})

# Find libraries with error handling
find_library(LIBAVCODEC_LIBRARY avcodec)
if(NOT LIBAVCODEC_LIBRARY)
    message(FATAL_ERROR "Could not find libavcodec")
endif()

find_library(LIBAVFORMAT_LIBRARY avformat)
if(NOT LIBAVFORMAT_LIBRARY)
    message(FATAL_ERROR "Could not find libavformat")
endif()

find_library(LIBZ_LIBRARY z)
if(NOT LIBZ_LIBRARY)
    message(FATAL_ERROR "Could not find libz")
endif()

find_library(LIBPNG_LIBRARY png16)
if(NOT LIBPNG_LIBRARY)
    message(FATAL_ERROR "Could not find libpng16")
endif()

find_library(LIBJPEG_LIBRARY jpeg)
if(NOT LIBJPEG_LIBRARY)
    message(FATAL_ERROR "Could not find libjpeg")
endif()

find_library(LIBFREETYPE_LIBRARY freetype)
if(NOT LIBFREETYPE_LIBRARY)
    message(FATAL_ERROR "Could not find libfreetype")
endif()

# Link with libraries
target_link_libraries(xenia
    # System libraries
    log
    android
    GLESv2
    OpenSLES

    # Other libraries
    ${LIBAVCODEC_LIBRARY}
    ${LIBAVFORMAT_LIBRARY}
    ${LIBZ_LIBRARY}
    ${LIBPNG_LIBRARY}
    ${LIBJPEG_LIBRARY}
    ${LIBFREETYPE_LIBRARY}
    
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