import 'package:flutter/material.dart';
import 'dart:async';
import 'tela_jogos.dart';

class LoadApp extends StatefulWidget {
  const LoadApp({Key? key}) : super(key: key);

  @override
  LoadAppState createState() => LoadAppState();
}

class LoadAppState extends State<LoadApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TelaJogos()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent, Colors.black],
              stops: [0.1, 0.3],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(
              image: ExactAssetImage('assets/imagens/telaPrincipal.png'),
              scale: 0.7,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 100, width: 100, child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
