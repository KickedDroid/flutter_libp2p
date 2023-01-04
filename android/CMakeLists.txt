set(LibraryVersion "flutter_libp2p-v0.0.0") # generated; do not edit

# Unlike the Windows & Linux CMakeLists.txt, this Android equivalent is just here
# to download the Android binaries into src/main/jniLibs/ and does not build anything.
# The binary download/extraction is difficult to do concisely in Groovy/Gradle,
# at least across host platforms, so we are just reusing our Linux/Windows logic.

# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

# Download the binaries if they are not already present.
set(LibRoot "${CMAKE_CURRENT_SOURCE_DIR}/src/main")
set(ArchivePath "${CMAKE_CURRENT_SOURCE_DIR}/${LibraryVersion}.tar.gz")

add_library(
        libnative_rust
        SHARED
        IMPORTED
        GLOBAL
)
set_target_properties(libnative_rust PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libnative_rust.so)
