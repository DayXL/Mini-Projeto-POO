import 'package:flutter/material.dart';
import 'package:mini_projeto/components/tela_jogos.dart';
import 'components/detalhes_jogos.dart';

void main() {

  MyApp app = const MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'principal',

        routes: {
          'principal': (context) => const TelaJogos(),
          'detalhesJogos': (context) => const DetalheJogos(),

        },
        );
  }
}
