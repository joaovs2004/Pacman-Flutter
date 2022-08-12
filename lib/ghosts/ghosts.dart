import 'package:bonfire/bonfire.dart';
import 'package:labirinto_escribo/ghosts/ghosts_spritesheet.dart';
import 'package:labirinto_escribo/player/player.dart';

class Ghost extends SimpleEnemy with ObjectCollision {
  final Pacman pacman;

  Ghost(Vector2 position, this.pacman)
      : super(
          position: position,
          size: Vector2(28, 28),
          speed: 40,
          animation: GhostSpriteSheet.simpleDirectionAnimation,
        ) {
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
      closePlayer: (
        player,
      ) {
        if (!pacman.havePower) {
          player.die();
        } else {
          removeFromParent();
        }
      },
      radiusVision: 400,
      margin: 4,
    );
    if (pacman.havePower) {
      opacity = 0.3;
      // animation = InGhostSpriteSheet.simpleDirectionAnimation;
    } else {
      opacity = 1;
    }
    super.update(dt);
  }
}
