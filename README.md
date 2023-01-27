# Flutter/Dart Libp2p 
flutter_libp2p is implemented using rust-libp2p and FFI. Read more about rust-libp2p [here](https://github.com/libp2p/rust-libp2p)

## How it works 
- Dart FFI
- flutter_rust_bridge
- Cbor/Json RPC using embedded websockets


# Usage
To spawn a libp2p node in flutter_libp2p use the start method
````Dart
flutter_libp2p.spawnNode();
````
Listen to Swarm events
````Dart
await flutter_libp2p.events();
````

To use in your flutter app you can call `flutter_libp2p.spawnNode()` in the initState method in main.dart like so 
````Dart
class _MyAppState extends State<MyApp> {
  ....
  
  @override
  void initState() {
    super.initState();
    flutter_libp2p.spawnNode();
  }
  
  .... //Proceeding Code
}
````

Get the current Local Peer Id
````Dart
String pid = await flutter_libp2p.localPeerId();
````

Dial one or multiple from a list of Multi-Addresses
````Dart
List<String> toDial = [
    "/ip4/172.30.144.1/tcp/42006/p2p/12D3KooWDk4Dez7KeWi5Z6JMVgQdEateaBY26yBpasdUedn29GaA"
  ];
// Note dial will not return result, instead event is sent through event stream  
await flutter_libp2p.dial(toDial);
````
