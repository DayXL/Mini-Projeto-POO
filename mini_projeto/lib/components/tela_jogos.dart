import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_projeto/services/game_services.dart';
import './myappbar.dart';
import './refresh_button.dart';
import '../layouts/bottom_navbar.dart';

late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

final GameService gameService = GameService();

class TelaJogos extends StatelessWidget {
  const TelaJogos({super.key});

  @override
  Widget build(BuildContext context) {
    _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

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
                    return const SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                                ' 1 - Para gerar uma tabela, seleciona algum botão abaixo',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 15)),
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

  Loading(
      {this.jsonObjects = const [],
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
