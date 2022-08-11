import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/player.dart';
import 'package:labirinto_escribo/points.dart';
import 'package:labirinto_escribo/points_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacman Escribo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pacman pacman = Pacman(Vector2(180, 234));

    return BonfireTiledWidget(
      joystick: Joystick(
          keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
          directional: JoystickDirectional()),
      map: TiledWorldMap('map/map.json',
          objectsBuilder: {
            'points': (properties) => Points(properties.position)
          },
          forceTileSize: const Size(7, 7)),
      overlayBuilderMap: {
        'points': (context, game) => PointsInterface(
              game: game,
              pacman: pacman,
            )
      },
      initialActiveOverlays: const [PointsInterface.overlaykey],
      player: pacman,
      cameraConfig: CameraConfig(
        moveOnlyMapArea: false,
        zoom: 1.02,
      ),
    );
  }
}
