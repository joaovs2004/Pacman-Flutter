import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/player/player_spritesheet.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  int points = 0;

  Pacman(Vector2 position)
      : super(
            position: position,
            size: Vector2(32, 32),
            animation: PlayerSpriteSheet.simpleDirectionAnimation) {
    setupCollision(CollisionConfig(enable: true, collisions: [
      CollisionArea.rectangle(
        size: Vector2(23, 23),
        align: Vector2(0, 0),
      )
    ]));
  }

  int getPoints() {
    return points;
  }

  void addPoints() {
    points += 10;
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
