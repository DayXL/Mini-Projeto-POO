import 'package:flutter/material.dart';
import 'package:mini_projeto/services/game_services.dart';
import './tela_jogos.dart';
import 'dart:math';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return FloatingActionButton(
      onPressed: () {
        numPagePad = random.nextInt(101);
        gameService.carregarJogos();
      },
      backgroundColor: Colors.greenAccent,
      elevation: 5.0,
      shape: const CircleBorder(),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.refresh,
            size: 32.0,
          ),
        ),
      ),
    );
  }
}
