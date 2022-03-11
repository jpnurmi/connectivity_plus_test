import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Connectivity')),
        body: Provider(
          create: (_) => Connectivity(),
          child: const Center(child: ConnectivityConsumer()),
        ),
      ),
    ),
  );
}

class ConnectivityConsumer extends StatelessWidget {
  const ConnectivityConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ConnectivityResult>(
      future: context.read<Connectivity>().checkConnectivity(),
      builder: (context, snapshot) => Text(snapshot.data.toString()),
    );
  }
}
