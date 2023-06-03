import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/connection_service.dart';

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
    'propertyNames': []
  });

  int numPagePad;

  GameService(this.numPagePad);

  Future<void> carregarJogos() async {
    print('carregarJogos');

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
      queryParameters: {'key': apiKey, 'size': '9', 'page': '$numPagePad'},
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
    favoriteStateNotifier.value = {
      'status': ConnectionStatus.ready,
      'dataObjects': [
        {'name': name, 'released': released, 'background_image': image}
      ],
      'propertyNames': ['name', 'released', 'background_image']
    };
  }

  void loadFavorite() {
    favoriteStateNotifier.value = {
      'status': ConnectionStatus.ready,
      'dataObjects': [],
      'propertyNames': ['name', 'released', 'background_image']
    };
  }
}
