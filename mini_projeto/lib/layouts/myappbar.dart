import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../components/tela_jogos.dart';
import 'dart:convert';
import 'dart:math';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Jogos"),
      backgroundColor: Colors.greenAccent,
      actions: [
        GestureDetector(
          onTap: () => launchUrlString('https://rawg.io/apidocs'),
          child: const Padding(
              padding: EdgeInsets.only(top: 19, right: 16),
              child:
                  Text("Explorar Rawg.io API", style: TextStyle(fontSize: 16))),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            gameService.carregarJogos(Random().nextInt(101));
          },
        ),
        PopupMenuButton(
          onSelected: gameService.mudarGenero,
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) {
            return criarPopupItens(generosJogos, generosIcons);
          },
        )
      ],
    );
  }

  List<PopupMenuItem<int>> criarPopupItens(String json, List<IconData> icons) {
    List<dynamic> genres = jsonDecode(json);

    return genres.map((genre) {
      String name = genre['name'];
      int id = genre['id'];

      int iconIndex = genres.indexOf(genre);
      Icon? icon;

      if (iconIndex >= 0 && iconIndex < icons.length) {
        icon = Icon(icons[iconIndex]);
      }

      ListTile listTile = ListTile(
        leading: icon,
        title: Text(name),
      );

      PopupMenuItem<int> menuItem = PopupMenuItem<int>(
        value: id,
        child: listTile,
      );

      return menuItem;
    }).toList();
  }
}

String generosJogos = '''
[
    {
      "id": 4,
      "name": "Action",
      "icon": "icons/action.png"
    },
    {
      "id": 51,
      "name": "Indie",
      "icon": "icons/indie.png"
    },
    {
      "id": 3,
      "name": "Adventure",
      "icon": "icons/adventure.png"
    },
    {
      "id": 5,
      "name": "RPG",
      "icon": "icons/rpg.png"
    },
    {
      "id": 10,
      "name": "Strategy",
      "icon": "icons/strategy.png"
    },
    {
      "id": 2,
      "name": "Shooter",
      "icon": "icons/shooter.png"
    },
    {
      "id": 40,
      "name": "Casual",
      "icon": "icons/casual.png"
    },
    {
      "id": 14,
      "name": "Simulation",
      "icon": "icons/simulation.png"
    },
    {
      "id": 7,
      "name": "Puzzle",
      "icon": "icons/puzzle.png"
    },
    {
      "id": 11,
      "name": "Arcade",
      "icon": "icons/arcade.png"
    },
    {
      "id": 83,
      "name": "Platformer",
      "icon": "icons/platformer.png"
    },
    {
      "id": 59,
      "name": "Massively Multiplayer",
      "icon": "icons/mmo.png"
    },
    {
      "id": 1,
      "name": "Racing",
      "icon": "icons/racing.png"
    },
    {
      "id": 15,
      "name": "Sports",
      "icon": "icons/sports.png"
    },
    {
      "id": 6,
      "name": "Fighting",
      "icon": "icons/fighting.png"
    },
    {
      "id": 19,
      "name": "Family",
      "icon": "icons/family.png"
    }
]
''';

const List<IconData> generosIcons = [
  Icons.directions_run, // Action
  Icons.emoji_objects, // Indie
  Icons.explore, // Adventure
  Icons.flag, // RPG
  Icons.leaderboard, // Strategy
  Icons.bolt, // Shooter
  Icons.child_care, // Casual
  Icons.spa, // Simulation
  Icons.extension, // Puzzle
  Icons.gamepad, // Arcade
  Icons.format_paint, // Platformer
  Icons.public, // Massively Multiplayer
  Icons.directions_car, // Racing
  Icons.sports_soccer, // Sports
  Icons.fitness_center, // Fighting
  Icons.family_restroom, // Family
];
