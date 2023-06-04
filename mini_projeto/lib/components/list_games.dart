import 'package:flutter/material.dart';
import '../services/game_services.dart';
import 'detalhes_jogos.dart';

class LoadGameList extends StatelessWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;

  const LoadGameList(
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

class ConteudoCorpo extends StatelessWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;

  const ConteudoCorpo(
      {super.key,
      this.jsonObjects = const [],
      this.propertyNames = const ["name", "released", "background_image"],
      required this.gameService});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jsonObjects.map((jsonObject) {
        final String text1 = jsonObject['name'] ?? '';
        final String imagem = jsonObject['background_image'] ?? '';
        final String text2 = jsonObject['released'] ?? '';

        return Container(
          margin: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetalheJogos()),
                    );
                  },
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(imagem),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        text2,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      //add to favorites
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          gameService.addFavorite(
                              jsonObject['name'],
                              jsonObject['released'],
                              jsonObject['background_image']);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
