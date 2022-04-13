import 'package:flame/components.dart'
    show
        SpriteAnimationGroupComponent,
        SpriteAnimation,
        SpriteAnimationData,
        Vector2,
        Tappable;

import 'package:flame/effects.dart' show MoveEffect, EffectController;

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
            size: Vector2(widthCat, heightCat),
            position: Vector2(0, 400),
            scale: Vector2.all(1.5)) {
    CatStatus.values.forEach((status) {
      this.animations!.addAll({
        status: SpriteAnimation.fromFrameData(
            this.spriteSheet[status]!["image"],
            SpriteAnimationData.sequenced(
                amount: this.spriteSheet[status]!["nb_sprites"],
                stepTime: 0.1,
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

    return true;
  }

  @override
  void update(double dt) {
    // TODO: implement update

    if (this.current == CatStatus.walk) {
      final effect =
          MoveEffect.by(Vector2(15, 0), EffectController(duration: 0.5));
    }

    super.update(dt);
  }
}
