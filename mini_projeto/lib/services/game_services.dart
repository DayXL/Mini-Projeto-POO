import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/connection_service.dart';
import 'dart:math';

enum ConnectionStatus { loading, ready, error }

class GameService {
  final ValueNotifier<Map<String, dynamic>> gameStateNotifier = ValueNotifier({
    'status': ConnectionStatus.loading,
    'dataObjects': [],
    'propertyNames': []
  });

  final ValueNotifier<Map<String, dynamic>> favoriteStateNotifier =
      ValueNotifier({
    'status': ConnectionStatus.ready,
    'dataObjects': [],
    'propertyNames': ["name", "released", "background_image"]
  });

  final ValueNotifier<Map<String, dynamic>> detalheGameStateNotifier =
      ValueNotifier({
    'status': ConnectionStatus.loading,
    'dataObjects': [],
    'propertyNames': []
  });

  int numPagePad = Random().nextInt(101);
  String generoJogo = '';

  Future<void> carregarJogos(int valor) async {
    numPagePad = valor;

    bool isConnected = await ConnectionService().isConnected();

    if (!isConnected) {
      gameStateNotifier.value = {
        'status': ConnectionStatus.error,
        'dataObjects': []
      };

      return;
    }

    var apiKey = '14e4419142c349faa4079c0243beb8f1';

    var gamesUri = Uri(
      scheme: 'https',
      host: 'api.rawg.io',
      path: 'api/games',
      queryParameters: {
        'key': apiKey,
        'size': '9',
        'page': '$numPagePad',
        if (generoJogo.isNotEmpty) 'genres': generoJogo,
      },
    );

    var jsonString = await http.read(gamesUri);
    var gamesJson = jsonDecode(jsonString);

    gameStateNotifier.value = {
      'status': ConnectionStatus.ready,
      'dataObjects': gamesJson['results'],
      'propertyNames': ['id', 'name', 'released', 'background_image']
    };
  }

  Future<void> carregarDetalhesJogos(int idNovo) async {
    bool isConnected = await ConnectionService().isConnected();

    if (!isConnected) {
      detalheGameStateNotifier.value = {
        'status': ConnectionStatus.error,
        'dataObjects': []
      };

      return;
    }

    var apiKey = '14e4419142c349faa4079c0243beb8f1';

    int id = idNovo;

    var gamesUri = Uri(
      scheme: 'https',
      host: 'api.rawg.io',
      path: 'api/games/$id',
      queryParameters: {
        'key': apiKey,
      },
    );

    var jsonString = await http.read(gamesUri);
    var gamesJson = jsonDecode(jsonString);

    print("carregar $gamesJson");

    detalheGameStateNotifier.value = {
      'status': ConnectionStatus.ready,
      'dataObjects': [gamesJson],
      'propertyNames': ["description"]
    };
  }

  void addFavorite(String name, String released, String image) {
    final List<Map<String, dynamic>> favorites =
        List.from(favoriteStateNotifier.value['dataObjects']);
    favorites.add({
      'name': name,
      'released': released,
      'background_image': image,
    });

    favoriteStateNotifier.value = {
      'status': ConnectionStatus.ready,
      'dataObjects': favorites,
      'propertyNames': ['name', 'released', 'background_image']
    };
  }

  bool isFavorite(String name) {
    final List<Map<String, dynamic>> favorites =
        List.from(favoriteStateNotifier.value['dataObjects']);

    return favorites.any((element) => element['name'] == name);
  }

  void removeFavorite(String name) {
    final List<Map<String, dynamic>> favorites =
        List.from(favoriteStateNotifier.value['dataObjects']);

    favoriteStateNotifier.value = {
      'status': ConnectionStatus.ready,
      'dataObjects':
          favorites.where((element) => element['name'] != name).toList(),
      'propertyNames': ['name', 'released', 'background_image']
    };
  }

  void mudarGenero(int genreId) {
    generoJogo = '$genreId';
    carregarJogos(Random().nextInt(101));
  }
}
