import 'package:flutter/material.dart';
import 'package:mini_projeto/services/game_services.dart';
import './tela_jogos.dart';

class RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        numPagePad = numPagePad + 1;
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
