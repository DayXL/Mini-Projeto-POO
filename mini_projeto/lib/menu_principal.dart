import 'package:flutter/material.dart';
import './components/loading.dart';

late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

void main() {
  _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  MyApp app = const MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScaffoldMessenger(
            key: _scaffoldMessengerKey,
            child: const Scaffold(
              body: Loading(),
            )));
  }
}
