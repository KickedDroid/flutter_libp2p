export 'flutter_libp2p.dart';
import 'dart:async';
import 'dart:math';

import 'ffi.dart' if (dart.library.html) 'ffi_web.dart';
import 'package:cbor/cbor.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';

Future<void> start() async {
  api.start();
}

// Local
Future<String> localPeerId() async {
  final wsUrl = Uri.parse('ws://localhost:9002');
  var channel = WebSocketChannel.connect(wsUrl);
  channel.sink.add("local_peer_id");

  String pid = "Bruh";
  StreamSubscription? s;
  return channel.stream
      .listen((msg) {
        print(msg);
        pid = msg.toString();
        channel.sink.close(status.goingAway);
        s!.cancel();
      })
      .asFuture()
      .then((_) => pid);
}
