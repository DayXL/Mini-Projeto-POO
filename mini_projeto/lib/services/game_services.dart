import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class GameService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'columnNames': [], // Adicione esta linha
  });

  void carregarJogos() {
    var apiKey = '14e4419142c349faa4079c0243beb8f1';

    var gamesUri = Uri(
      scheme: 'https',
      host: 'api.rawg.io',
      path: 'api/games?key=$apiKey',
      queryParameters: {'size': '9'},
    );

    http.read(gamesUri).then((jsonString) {
      var gameJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': gameJson,
        'columnNames': ["ID", "Nome", "Added"], // Atualize esta linha
        'propertyNames': ["id", "name", "added"]
      };
    });
  }
}
