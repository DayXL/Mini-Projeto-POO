import 'package:flutter/material.dart';
import './tela_jogos.dart';
import '../services/game_services.dart';
import 'package:html/parser.dart';

class DetalheTelaJogos extends StatelessWidget {
  final id;
  final name;
  final imagem;
  DetalheTelaJogos({super.key, this.id, this.name, this.imagem});

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(name: name),
          ),
          body: ValueListenableBuilder(
              valueListenable: gameService.detalheGameStateNotifier,
              builder: (_, value, __) {
                if (value['status'] == ConnectionStatus.loading) {
                  return Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.greenAccent, Colors.black],
                          stops: [0.1, 0.3],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Center(
                          child: SizedBox(child: CircularProgressIndicator())));
                }

                if (value['status'] == ConnectionStatus.error) {
                  return const Center(
                    child: Text('Erro ao carregar os dados'),
                  );
                }
                return LoadDetalheGames(
                  imagem: imagem,
                  jsonObjects: value['dataObjects'],
                  propertyNames: value['propertyNames'],
                  gameService: gameService,
                );
              }),
        ));
  }
}

class LoadDetalheGames extends StatelessWidget {
  final List jsonObjects;
  final List propertyNames;
  final GameService gameService;
  final imagem;

  const LoadDetalheGames(
      {super.key,
      this.jsonObjects = const [],
      this.propertyNames = const ["description"],
      required this.gameService,
      this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.black],
          stops: [0.1, 0.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ConteudoCorpoDetal(
        imagem: imagem,
        jsonObjects: jsonObjects,
        gameService: gameService,
      ),
    );
  }
}

class ConteudoCorpoDetal extends StatefulWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;
  final imagem;

  const ConteudoCorpoDetal(
      {Key? key,
      this.jsonObjects = const [],
      this.propertyNames = const ["description"],
      required this.gameService,
      this.imagem})
      : super(key: key);

  @override
  _ConteudoCorpoDetalState createState() => _ConteudoCorpoDetalState();
}

class _ConteudoCorpoDetalState extends State<ConteudoCorpoDetal> {
  @override
  Widget build(BuildContext context) {
    var unformatedContent = widget.jsonObjects[0][widget.propertyNames[0]];

    String htmlText = parse(unformatedContent).body!.text;

    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.black],
            stops: [0.1, 0.3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Image.network(widget.imagem),
                    Positioned(
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, size: 50.0),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(children: [
              Card(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Text(
                    htmlText,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]));
  }
}

class MyAppBar extends StatelessWidget {
  final name;
  const MyAppBar({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(name),
      backgroundColor: Colors.greenAccent,
    );
  }
}
