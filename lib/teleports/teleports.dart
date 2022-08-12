import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

class TeleportSpriteSheet {
  static Future<Sprite> get teleport => Sprite.load(
        'transparent.png',
        srcPosition: Vector2(2, 2),
        srcSize: Vector2(16, 16),
      );
}

class Teleport extends GameDecoration with Sensor {
  final int? id;

  Teleport(Vector2 position, this.id)
      : super.withSprite(
          sprite: TeleportSpriteSheet.teleport,
          position: position,
          size: Vector2(16, 50),
        );

  @override
  void render(Canvas canvas) {
    opacity = 0;
    super.render(canvas);
  }

  @override
  void onContact(GameComponent component) {
    if (id == 207) {
      (component).position = Vector2(49 * 7, 27 * 7);
    } else if (id == 208) {
      (component).position = Vector2(4 * 7, 27 * 7);
    }
  }
}
