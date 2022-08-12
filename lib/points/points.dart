import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/player/player.dart';

class PointsSpriteSheet {
  static Future<Sprite> get points => Sprite.load('points.png',
      srcPosition: Vector2(0, 0), srcSize: Vector2(16, 16));
}

class Points extends GameDecoration with Sensor {
  Points(Vector2 position)
      : super.withSprite(
            sprite: PointsSpriteSheet.points,
            position: position,
            size: Vector2(16, 16));

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      (component).addPoints();
      removeFromParent();
    }
  }
}
