flutter_rust_bridge_codegen --rust-input native\src\api.rs --dart-output .\lib\bridge_generated.dart --dart-decl-output .\lib\bridge_definitions.dart 


## How it works 
- Dart FFI
- flutter_rust_bridge
- Cbor/Json RPC using embedded websockets



// For android
cargo ndk -o ../android/app/src/main/jniLibs -t x86_64 -t x86 -t arm64-v8a -t armeabi-v7a build --release

// For Example
cargo ndk -o ../example/android/app/src/main/jniLibs -t x86_64 -t x86 -t arm64-v8a -t armeabi-v7a build --release