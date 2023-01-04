import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.web.dart';

export 'bridge_definitions.dart';

const root = 'pkg/native';
final api = NativeRustImpl.wasm(
  WasmModule.initialize(kind: const Modules.noModules(root: root)),
);
