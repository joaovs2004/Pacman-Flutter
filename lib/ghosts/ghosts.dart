import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/ghosts/ghosts_spritesheet.dart';

class Ghost extends SimpleEnemy with ObjectCollision {
  Ghost(Vector2 position)
      : super(
            position: position,
            size: Vector2(28, 28),
            speed: 40,
            animation: GhostSpriteSheet.simpleDirectionAnimation) {
    setupCollision(CollisionConfig(enable: true, collisions: [
      CollisionArea.rectangle(
        size: Vector2(20, 20),
        align: Vector2(0, 0),
      )
    ]));
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        player.die();
      },
      radiusVision: 400,
      margin: 4,
    );
    super.update(dt);
  }
}
