import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    flutter_libp2p.start();
  }

  Future<String> load() async {
    var pid = await flutter_libp2p.localPeerId();
    return pid;
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
                  child: const Text("Click"),
                ),
                Text(peer_id)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
