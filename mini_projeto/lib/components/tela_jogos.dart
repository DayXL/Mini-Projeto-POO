import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_projeto/services/game_services.dart';
import './myappbar.dart';
import '../layouts/bottom_navbar.dart';

final GameService gameService = GameService();

class TelaJogos extends StatelessWidget {
  TelaJogos({super.key});

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(),
          ),
          body: ValueListenableBuilder(
              valueListenable: gameService.gameStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case ConnectionStatus.idle:
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 150),
                            const Text(
                              'Nenhum item selecionado',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              'Selecione um item abaixo',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            SizedBox(
                              height: 200,
                              child: Image.asset(
                                'assets/imagens/waiting.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    );

                  case ConnectionStatus.loading:
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
                            child:
                                SizedBox(child: CircularProgressIndicator())));

                  case ConnectionStatus.ready:
                    return Loading(
                      jsonObjects: value['dataObjects'],
                      propertyNames: value['propertyNames'],
                    );

                  case ConnectionStatus.error:
                    return const Text("Ops");
                }

                return const Text("...");
              }),
          bottomNavigationBar: MyBottomNavBar(
            itemSelectedCallback: (index) {
              if (index == 0) {
                Random random = Random();
                numPagePad = random.nextInt(101);
                gameService.carregarJogos();
              } else {
                _scaffoldMessengerKey.currentState!.showSnackBar(
                  const SnackBar(
                    content: Text('Favoritos'),
                  ),
                );
              }
            },
          ),
        ));
  }
}

class Loading extends StatelessWidget {
  final List jsonObjects;

  final List<String> propertyNames;

  const Loading(
      {super.key,
      this.jsonObjects = const [],
      this.propertyNames = const ["name", "style", "image_background"]});

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
      child: ConteudoCorpo(
        jsonObjects: jsonObjects,
        propertyNames: propertyNames,
      ),
    );
  }
}
