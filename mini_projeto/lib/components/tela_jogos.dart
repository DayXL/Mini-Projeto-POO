import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mini_projeto/services/game_services.dart';
import './myappbar.dart';
import '../layouts/bottom_navbar.dart';
import 'dart:math';

final GameService gameService = GameService(Random().nextInt(1000));

class TelaJogos extends HookWidget {
  TelaJogos({super.key});

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      gameService.carregarJogos();
      return null;
    }, []);

    final selectedIndex = useState(0);

    return ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(),
          ),
          body: selectedIndex.value == 0
              ? ValueListenableBuilder(
                  valueListenable: gameService.gameStateNotifier,
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
                              child: SizedBox(
                                  child: CircularProgressIndicator())));
                    }

                    if (value['status'] == ConnectionStatus.error) {
                      return const Center(
                        child: Text('Erro ao carregar os dados'),
                      );
                    }
                    return Loading(
                      jsonObjects: value['dataObjects'],
                      propertyNames: value['propertyNames'],
                      gameService: gameService,
                    );
                  })
              : const Center(
                  child: Text('Favoritos'),
                ),
          bottomNavigationBar: MyBottomNavBar(
            itemSelectedCallback: (index) {
              selectedIndex.value = index;
            },
          ),
        ));
  }
}

class Loading extends StatelessWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;

  const Loading(
      {super.key,
      this.jsonObjects = const [],
      this.propertyNames = const ["name", "style", "image_background"],
      required this.gameService});

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
        gameService: gameService,
      ),
    );
  }
}
