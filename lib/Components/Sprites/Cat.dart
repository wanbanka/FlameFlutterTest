import 'dart:async';

import '../Games/ForgeGame.dart';

import 'package:flame/components.dart';

import 'package:flame/effects.dart'
    show MoveByEffect, SequenceEffect, EffectController;

import 'package:flame/input.dart'
    show DragEndInfo, DragStartInfo, DragUpdateInfo;

enum CatStatus { normal, attack, death, walk, hurt }

class Cat extends SpriteAnimationGroupComponent
    with Draggable, HasGameRef<ForgeGame> {
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

  Future<void> walk() async {
    this.current = CatStatus.walk;

    var effect = SequenceEffect([
      MoveByEffect(Vector2(50, 0), EffectController(duration: 1.5)),
    ]);

    unawaited(add(effect));

    Future.delayed(Duration(milliseconds: 1500), () {
      this.current = CatStatus.normal;
    });
  }

  Vector2? dragDeltaPosition;

  bool get isDragging => dragDeltaPosition != null;

  @override
  bool onDragStart(DragStartInfo info) {
    // TODO: implement onDragStart

    dragDeltaPosition = info.eventPosition.game - this.position;

    return true;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    // TODO: implement onDragUpdate

    if (isDragging) {
      final localCoords = info.eventPosition.game;

      this.position = localCoords - dragDeltaPosition!;
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
}
