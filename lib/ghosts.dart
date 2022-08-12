import 'package:bonfire/bonfire.dart';

class GhostSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "ghosts.png",
        SpriteAnimationData.sequenced(
            amount: 1,
            stepTime: 0.5,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 0)),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: idleRight,
      );
}

class Ghost extends SimpleEnemy with ObjectCollision {
  Ghost(Vector2 position)
      : super(
            position: position,
            size: Vector2(28, 28),
            speed: 40,
            animation: GhostSpriteSheet.simpleDirectionAnimation) {
    setupCollision(CollisionConfig(enable: true, collisions: [
      CollisionArea.rectangle(size: Vector2(23, 23), align: Vector2(0, 0))
    ]));
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(closePlayer: (player) {}, radiusVision: 400);
    super.update(dt);
  }
}
