import 'package:flutter/material.dart';
import './components/loading.dart';


void main() {

  MyApp app = const MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScaffoldMessenger(
            child: Scaffold(
              body: Loading(),
            )));
  }
}
