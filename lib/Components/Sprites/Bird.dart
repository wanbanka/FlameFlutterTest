import 'dart:async';

import 'package:flame/components.dart';

import 'package:flame/collisions.dart'
    show
        CollisionCallbacks,
        RectangleHitbox,
        CircleHitbox,
        PolygonHitbox,
        CollisionType;

enum BirdStatus { idle }

class Bird extends SpriteAnimationGroupComponent
    with HasGameRef, CollisionCallbacks {
  Bird(
      {required this.spriteSheet,
      required this.widthBird,
      required this.heightBird})
      : super(
          animations: {},
          current: BirdStatus.idle,
          position: Vector2(250, 400),
          scale: Vector2(-1, 1),
          size: Vector2(widthBird, heightBird),
        ) {
    BirdStatus.values.forEach((status) {
      this.animations?.addAll({
        status: SpriteAnimation.fromFrameData(
            this.spriteSheet[status]!["image"],
            SpriteAnimationData.sequenced(
                amount: this.spriteSheet[status]!["nb_sprites"],
                stepTime: this.spriteSheet[status]!["step_time"] ?? 0.1,
                textureSize: Vector2(widthBird, heightBird)))
      });
    });
  }

  double widthBird;

  double heightBird;

  Map<BirdStatus, Map<String, dynamic>> spriteSheet;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
  }
}
