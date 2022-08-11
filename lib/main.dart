import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/player.dart';
import 'package:labirinto_escribo/points.dart';

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
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      player: Pacman(Vector2(180, 234)),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: false,
        zoom: 1.02,
      ),
    );
  }
}
