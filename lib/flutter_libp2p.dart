export 'flutter_libp2p.dart';
import 'dart:async';

import 'ffi.dart' if (dart.library.html) 'ffi_web.dart';
import 'package:cbor/cbor.dart';
import 'package:web_socket_client/web_socket_client.dart';

Future<void> start() async {
  api.start();
}
// Local
Future<String> localPeerId() async {
  var ws = WebSocket(Uri.parse('ws://127.0.0.1:9001'));
  await ws.connection.firstWhere((state) => state is Connected);
  var encoded =
      cbor.encode(CborMap({CborString("local_peer_id"): const CborBool(true)}));
  ws.send(encoded);

  var result = await ws.messages.firstWhere((element) => element != null);
  ws.close();
  return result.toString();
}
