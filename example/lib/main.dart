import 'package:flutter/material.dart';
import 'package:flutter_libp2p/ffi.dart';
import 'dart:async';

import 'package:flutter_libp2p/flutter_libp2p.dart' as flutter_libp2p;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String peer_id = "loading";
  late String listeners = "Loafing";

  List<String> toDial = [
    "/ip4/172.30.144.1/tcp/42006/p2p/12D3KooWDk4Dez7KeWi5Z6JMVgQdEateaBY26yBpasdUedn29GaA"
  ];

  List<String> events = [];

  @override
  void initState() {
    super.initState();
    flutter_libp2p.spawnNode();
  }

  Future<void> load() async {
    var stream = await flutter_libp2p.events();
    stream.listen((event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              // ignore: prefer_const_constructors
              children: [
                spacerSmall,
                spacerSmall,
                //
                TextButton(
                  onPressed: () async {
                    var res = await flutter_libp2p.localPeerId();
                    setState(() {
                      peer_id = res;
                    });
                  },
                  child: const Text("Get pid"),
                ),
                Text(peer_id),
                TextButton(
                  onPressed: () async {
                    await flutter_libp2p.dial(toDial);
                  },
                  child: const Text("Dial"),
                ),
                StreamBuilder(
                    // For when there are results over time
                    stream: api.eventStream(),
                    builder: (context, data) {
                      if (data.hasData) {
                        events.add(data.data.toString());
                        return Column(
                          children: [
                            Text("$events"),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
