import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';
import 'package:labirinto_escribo/player/player.dart';
import 'dart:async' as async;

class PointsInterface extends StatefulWidget {
  static const overlaykey = 'points';
  final BonfireGame game;
  final Pacman pacman;

  const PointsInterface({Key? key, required this.game, required this.pacman})
      : super(key: key);

  @override
  State<PointsInterface> createState() => _PointsInterfaceState();
}

class _PointsInterfaceState extends State<PointsInterface> {
  int points = 0;
  late async.Timer _time;

  @override
  void initState() {
    _time =
        async.Timer.periodic(const Duration(milliseconds: 100), _verifyPoints);

    super.initState();
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 250,
      height: 50,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          "Pontos $points",
          maxLines: 1,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  void _verifyPoints(async.Timer timer) {
    if (points != widget.pacman.points) {
      setState(() {
        points = widget.pacman.points;
      });
    }
  }
}
