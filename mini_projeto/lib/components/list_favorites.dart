import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../services/game_services.dart';

class ListFavorites extends HookWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;

  const ListFavorites(
      {super.key,
      this.jsonObjects = const [],
      this.propertyNames = const ["name", "released", "background_image"],
      required this.gameService});

  @override
  Widget build(BuildContext context) {
    return jsonObjects.isEmpty
        ? Center(
            child: Column(
              
              children: <Widget>[
                const Flexible(child: const SizedBox(height: 150)),

                const Flexible(
                  child: Text(
                    'Você ainda não adicionou',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                 const Flexible(
                  child: Text(
                    'nenhum favorito',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                const Flexible(
                  child: SizedBox(
                    height: 80,
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/imagens/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],

            ),
          )
        : ListView(children: <Widget>[
            const SizedBox(height: 20),
            const Center(
              child: Text("Lista de Favoritos",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
            ),
            const SizedBox(height: 20),
            jsonObjects.isEmpty
                ? const Center(
                    child: Text("Você ainda não adicionou nenhum favorito",
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
                  )
                : Column(
                    children: jsonObjects.map(
                    (jsonObject) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            jsonObject[propertyNames[2]],
                            height: 150,
                            scale: 0.4,
                          ),
                          title: Text(jsonObject[propertyNames[0]]),
                          subtitle: Text(jsonObject[propertyNames[1]]),
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite),
                            color: Colors.red,
                            onPressed: () {
                              gameService.favoriteStateNotifier.value = {
                                'status': ConnectionStatus.ready,
                                'dataObjects': gameService
                                    .favoriteStateNotifier.value['dataObjects']
                                    .where((element) =>
                                        element[propertyNames[0]] !=
                                        jsonObject[propertyNames[0]])
                                    .toList(),
                                'propertyNames': gameService
                                    .favoriteStateNotifier
                                    .value['propertyNames'],
                              };
                            },
                          ),
                        ),
                      );
                    },
                  ).toList()),
          ]);
  }
}
