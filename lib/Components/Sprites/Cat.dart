import 'dart:async';

import 'package:flutter/material.dart' show Color, Offset;

import 'package:flame/components.dart'
    show
        SpriteAnimationGroupComponent,
        SpriteAnimation,
        SpriteAnimationData,
        Vector2,
        Tappable;

import 'package:flame/effects.dart'
    show MoveByEffect, SequenceEffect, ColorEffect, EffectController;

import 'package:flame/input.dart' show TapDownInfo, TapUpInfo;

enum CatStatus { normal, attack, death, walk, hurt }

class Cat extends SpriteAnimationGroupComponent with Tappable {
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
    });
  }

  double widthCat;

  double heightCat;

  Map<CatStatus, Map<String, dynamic>> spriteSheet;

  @override
  bool onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp

    this.current = CatStatus.walk;

    var effect = SequenceEffect([
      ColorEffect(
          Color(0xFF0FF0), Offset(0.0, 0.8), EffectController(duration: 0.2)),
      MoveByEffect(Vector2(50, 0), EffectController(duration: 1.5)),
    ]);

    unawaited(add(effect));

    Future.delayed(Duration(milliseconds: 1500), () {
      this.current = CatStatus.normal;
    });

    return true;
  }
}
