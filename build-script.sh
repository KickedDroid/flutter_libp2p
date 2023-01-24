#!/bin/bash
flutter_rust_bridge_codegen --rust-input native_rust\src\api.rs --dart-output .\lib\bridge_generated.dart --dart-decl-output .\lib\bridge_definitions.dart

cd native_rust

cargo ndk -o ../android/app/src/main/jniLibs -t x86_64 -t x86 -t arm64-v8a -t armeabi-v7a build --release

cargo ndk -o ../example/android/app/src/main/jniLibs -t x86_64 -t x86 -t arm64-v8a -t armeabi-v7a build --release

echo "Hello"

set +ex