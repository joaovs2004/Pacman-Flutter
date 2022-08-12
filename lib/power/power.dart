import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/player/player.dart';

class PowerSpriteSheet {
  static Future<Sprite> get power => Sprite.load(
        'points.png',
        srcPosition: Vector2(0, 1),
        srcSize: Vector2(16, 16),
      );
}

class Power extends GameDecoration with Sensor {
  Power(Vector2 position)
      : super.withSprite(
          sprite: PowerSpriteSheet.power,
          position: position,
          size: Vector2(32, 32),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      (component).getPower();
      removeFromParent();
    }
  }
}
