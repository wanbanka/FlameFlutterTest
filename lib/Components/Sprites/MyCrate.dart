import 'package:flame/components.dart'
    show
        SpriteAnimationComponent,
        SpriteAnimationData,
        SpriteAnimation,
        Vector2,
        Anchor;

import "dart:ui" show Image;

/**
 * Génère un sprite
 */

class MyCrate extends SpriteAnimationComponent {
  MyCrate({required this.spriteSheet}) : super() {
    this.animation = SpriteAnimation.fromFrameData(
        spriteSheet,
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.1, textureSize: Vector2(72, 72)));

    this.size = Vector2.all(72);
  }

  late Image spriteSheet;

  /*void walk({required bool forward, double? x, double? y}) {
    print("Coords: $x, $y");

    this.position.x += forward ? (x ?? 0) : -(x ?? 0);

    this.position.y += forward ? (y ?? 0) : -(y ?? 0);
  }*/

//Modifie le composant lors du changement de taille
//(modification de la variable position du sprite)

  @override
  void onGameResize(Vector2 size) {
    // TODO: implement onGameResize
    super.onGameResize(size);

    position = size / 2;
  }
}
