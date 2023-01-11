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
  var enc = cbor.encode(CborMap({
    CborString("local_peer_id"):
        CborMap({CborString("local_peer_id"): CborString("")})
  }));
  channel.sink.add(enc);

  String pid = "Bruh";
  StreamSubscription? s;
  return channel.stream
      .listen((msg) {
        print(msg);
        pid = msg.toString();
        channel.sink.close(status.goingAway);
      })
      .asFuture()
      .then((_) => pid);
}

Future<void> dial() async {
  final wsUrl = Uri.parse('ws://localhost:9002');
  var channel = WebSocketChannel.connect(wsUrl);
  var enc = cbor.encode(CborMap({
    CborString("local_peer_id"):
        CborMap({CborString("dial_addrs"): CborString("")})
  }));
  channel.sink.add(enc);
}

Future<String> listeners() async {
  final wsUrl = Uri.parse('ws://localhost:9002');
  var channel = WebSocketChannel.connect(wsUrl);
  var enc = cbor.encode(CborMap({CborString("listeners"): CborString("get")}));
  channel.sink.add(enc);

  String lis = "Loading";

  return channel.stream
      .listen((msg) {
        print(msg);
        lis = msg.toString();
        channel.sink.close(status.goingAway);
      })
      .asFuture()
      .then((_) => lis);
}
