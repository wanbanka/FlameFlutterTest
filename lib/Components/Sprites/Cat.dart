import 'dart:async';

import 'package:welcomeback/Components/Worlds/World1.dart';

import '../Games/MyGame.dart';

import 'package:flame/components.dart';

import 'package:flame/effects.dart'
    show MoveByEffect, SequenceEffect, EffectController;

import 'package:flame/input.dart'
    show TapDownInfo, TapUpInfo, DragStartInfo, DragUpdateInfo, DragEndInfo;

import 'package:flame/collisions.dart'
    show CollisionCallbacks, RectangleHitbox, CollisionType;

enum CatStatus { normal, attack, death, walk, hurt }

class Cat extends SpriteAnimationGroupComponent
    with Tappable, Draggable, HasGameRef<MyGame>, CollisionCallbacks {
  Cat(
      {required this.spriteSheet,
      required this.widthCat,
      required this.heightCat})
      : super(
            animations: {},
            current: CatStatus.normal,
            position: Vector2(0, 400),
            size: Vector2(widthCat, heightCat),
            scale: Vector2.all(1.5)) {
    CatStatus.values.forEach((status) {
      this.animations?.addAll({
        status: SpriteAnimation.fromFrameData(
            this.spriteSheet[status]!["image"],
            SpriteAnimationData.sequenced(
                amount: this.spriteSheet[status]!["nb_sprites"],
                stepTime: this.spriteSheet[status]!["step_time"] ?? 0.1,
                textureSize: Vector2(widthCat, heightCat)))
      });

      this.paint = debugPaint;
    });
  }

  double widthCat;

  double heightCat;

  Map<CatStatus, Map<String, dynamic>> spriteSheet;

  Vector2? dragDeltaPosition;

  bool get isDragging => dragDeltaPosition != null;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    await add(RectangleHitbox(
        size: Vector2(this.widthCat, this.heightCat / 2),
        position: Vector2(0, this.heightCat / 2)));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    print("Collision found: $intersectionPoints of $other");
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd

    print("No more collisions with $other");
  }

  @override
  bool onDragStart(DragStartInfo info) {
    // TODO: implement onDragStart

    dragDeltaPosition = info.eventPosition.game - position;

    return true;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    // TODO: implement onDragUpdate

    if (isDragging) {
      final localCoords = info.eventPosition.game;

      position = localCoords - dragDeltaPosition!;
    }

    return true;
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    // TODO: implement onDragEnd

    dragDeltaPosition = null;

    return true;
  }

  @override
  bool onDragCancel() {
    // TODO: implement onDragCancel
    dragDeltaPosition = null;

    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp

    print("Player tap up on ${info.eventPosition.game}");

    this.current = CatStatus.walk;

    var effect = SequenceEffect([
      MoveByEffect(Vector2(50, 0), EffectController(duration: 1.5)),
    ]);

    unawaited(add(effect));

    var parallaxSearch =
        (gameRef.cameras.first.world as World1).parallax.first.parallax;

    parallaxSearch?.baseVelocity = Vector2(50, 0);

    Future.delayed(Duration(milliseconds: 1500), () {
      this.current = CatStatus.normal;

      parallaxSearch?.baseVelocity = Vector2.zero();
    });

    return true;
  }

  @override
  bool onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown

    print("Player tap down on ${info.eventPosition.game}");

    return true;
  }
}
