import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Jogos"),
      backgroundColor: Colors.greenAccent,
      actions: [
        PopupMenuButton(
          onSelected: (quantidade) {},
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) {
            return criarPopupItens();
          },
        )
      ],
    );
  }

  criarPopupItens() {
    return const [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.sports_kabaddi), // Ícone para Ação
          title: Text('Ação'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.explore), // Ícone para Aventura
          title: Text('Aventura'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.menu_book), // Ícone para RPG
          title: Text('RPG (Role-Playing Game)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.lightbulb), // Ícone para Estratégia
          title: Text('Estratégia'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.extension), // Ícone para Quebra-cabeça
          title: Text('Quebra-cabeça'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.directions_run), // Ícone para Plataforma
          title: Text('Plataforma'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.shutter_speed), // Ícone para Tiro
          title: Text('Tiro (FPS - First-Person Shooter)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.sports_mma), // Ícone para Luta
          title: Text('Luta (Fighting)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.sports_soccer), // Ícone para Esportes
          title: Text('Esportes'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.directions_car), // Ícone para Corrida
          title: Text('Corrida'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.build), // Ícone para Simulação
          title: Text('Simulação'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.warning), // Ícone para Sobrevivência
          title: Text('Sobrevivência (Survival)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.nightlight_round), // Ícone para Terror
          title: Text('Terror (Horror)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.public), // Ícone para Mundo aberto
          title: Text('Mundo aberto (Open-world)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.group), // Ícone para MMO
          title: Text('MMO (Massively Multiplayer Online)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.deck), // Ícone para Cartas
          title: Text('Cartas'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.music_note), // Ícone para Música
          title: Text('Música'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.gamepad), // Ícone para Arcade
          title: Text('Arcade'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.timer), // Ícone para Estratégia em tempo real
          title: Text('Estratégia em tempo real (RTS - Real-Time Strategy)'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.casino), // Ícone para Jogos de tabuleiro
          title: Text('Jogos de tabuleiro'),
        ),
      ),
    ];
  }
}
