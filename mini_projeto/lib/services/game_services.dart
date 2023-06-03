import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/detalhes_jogos.dart';
import '../services/connection_service.dart';

enum ConnectionStatus { idle, loading, ready, error }

int numPagePad = 0;

class GameService {
  final ValueNotifier<Map<String, dynamic>> gameStateNotifier =
      ValueNotifier({'status': ConnectionStatus.idle, 'dataObjects': []});

  final ValueNotifier<Map<String, dynamic>> favoriteStateNotifier =
      ValueNotifier({'status': ConnectionStatus.ready, 'dataObjects': []});

  Future<void> carregarJogos() async {
    bool isConected = await ConnectionService().isConected();

    if (!isConected) {
      gameStateNotifier.value = {
        'status': ConnectionStatus.error,
        'dataObjects': []
      };

      return;
    }

    gameStateNotifier.value = {
      'status': ConnectionStatus.loading,
      'dataObjects': [],
    };

    var apiKey = '14e4419142c349faa4079c0243beb8f1';

    var gamesUri = Uri(
      scheme: 'https',
      host: 'api.rawg.io',
      path: 'api/games',
      queryParameters: {'key': apiKey, 'size': '9', 'page': '$numPagePad'},
    );

    http.read(gamesUri).then((jsonString) {
      var gameJson = jsonDecode(jsonString)["results"];

      gameStateNotifier.value = {
        'status': ConnectionStatus.ready,
        'dataObjects': gameJson,
        'propertyNames': ["id", "name", "released", "background_image"]
      };
    });
  }
}

class ConteudoCorpo extends StatelessWidget {
  final List jsonObjects;

  final List<String> propertyNames;

  const ConteudoCorpo(
      {this.jsonObjects = const [],
      this.propertyNames = const ["name", "released", "background_image"]});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jsonObjects.map((jsonObject) {
        final text1 = jsonObject['name'];
        final imagem = jsonObject['background_image'];
        final text2 = jsonObject['released'];

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
