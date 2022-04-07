import 'dart:ui' show Image;

import 'package:flame/components.dart'
    show
        SpriteAnimationComponent,
        SpriteAnimation,
        SpriteAnimationData,
        Vector2,
        Anchor,
        Draggable;

import 'package:flame/input.dart' show DragStartInfo, DragEndInfo;

class Mario extends SpriteAnimationComponent with Draggable {
  Mario({required this.spriteSheet, required this.onDragAudio}) : super() {
    this.animation = SpriteAnimation.fromFrameData(
        spriteSheet.first,
        SpriteAnimationData.sequenced(
            amount: 1, stepTime: 0.1, textureSize: Vector2(35, 43)));

    this.size = Vector2(35, 43);

    this.position = Vector2(250, 250);
  }

  late List<Image> spriteSheet;

  late Function onDragAudio;

  @override
  bool onDragStart(DragStartInfo infos) {
    this.animation = SpriteAnimation.fromFrameData(
        spriteSheet.last,
        SpriteAnimationData.sequenced(
            amount: 3, stepTime: 0.1, textureSize: Vector2(35, 43)));

    this.onDragAudio();

    return false;
  }

  @override
  bool onDragEnd(DragEndInfo infos) {
    this.animation = SpriteAnimation.fromFrameData(
        spriteSheet.first,
        SpriteAnimationData.sequenced(
            amount: 1, stepTime: 0.1, textureSize: Vector2(35, 43)));

    return false;
  }
}
