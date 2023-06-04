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

  int numPagePad;
  String generoJogo = '';

  GameService(this.numPagePad);

  Future<void> carregarJogos() async {
    numPagePad = Random().nextInt(101);

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
      'propertyNames': ['name', 'released', 'background_image']
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
    carregarJogos();
  }
}
