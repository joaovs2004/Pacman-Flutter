import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:labirinto_escribo/main.dart';
import 'package:labirinto_escribo/points/points.dart';

class MyGameController extends GameComponent {
  bool endgame = false;
  bool gameOver = false;

  @override
  void update(double dt) {
    if (checkInterval('check points', 100, dt)) {
      Iterable pointsRemaining = gameRef
          .componentsByType()
          .where((element) => element.runtimeType == Points);
      int remainingPoints = pointsRemaining.length;

      if (remainingPoints == 0 && !endgame) {
        endgame = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Voce Ganhou'),
                actions: [
                  TextButton(
                    onPressed: () {
                      _restart();
                    },
                    child: const Text('Recomeçar'),
                  )
                ],
              );
            });
      }

      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Voce morreu'),
                actions: [
                  TextButton(
                    onPressed: () {
                      _restart();
                    },
                    child: const Text('Recomeçar'),
                  )
                ],
              );
            });
      }
    }

    super.update(dt);
  }

  void _restart() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Game();
      }),
      (route) => false,
    );
  }
}
