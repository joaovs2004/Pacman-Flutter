import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "pacman.png",
        SpriteAnimationData.sequenced(
            amount: 1,
            stepTime: 0.5,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 0)),
      );

  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "pacman.png",
        SpriteAnimationData.sequenced(
            amount: 1,
            stepTime: 0.5,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 32 * 2)),
      );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "pacman.png",
        SpriteAnimationData.sequenced(
            amount: 1,
            stepTime: 0.5,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 32 * 3)),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "pacman.png",
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 0)),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "pacman.png",
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 32 * 2)),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "pacman.png",
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
            texturePosition: Vector2(0, 32 * 3)),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
          idleRight: idleRight,
          idleUp: idleUp,
          idleDown: idleDown,
          runRight: runRight,
          runUp: runUp,
          runDown: runDown);
}

class Pacman extends SimplePlayer with ObjectCollision {
  int points = 0;

  Pacman(Vector2 position)
      : super(
            position: position,
            size: Vector2(32, 32),
            animation: PlayerSpriteSheet.simpleDirectionAnimation) {
    setupCollision(CollisionConfig(enable: true, collisions: [
      CollisionArea.rectangle(size: Vector2(23, 23), align: Vector2(0, 0))
    ]));
  }

  int getPoints() {
    return points;
  }

  void addPoints() {
    points += 10;
  }
}
