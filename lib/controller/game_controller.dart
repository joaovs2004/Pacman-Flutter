import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:labirinto_escribo/points/points.dart';

class MyGameController extends GameComponent {
  bool endgame = false;

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
              return const AlertDialog(
                content: Text('Voce Ganhou'),
              );
            });
      }
    }

    super.update(dt);
  }
}
