import 'package:flame/components.dart'
    show SpriteGroupComponent, Sprite, Tappable, Vector2;

import 'package:flame/input.dart' show TapUpInfo, TapDownInfo;

import 'dart:ui' show Image;

enum ButtonState { pressed, unpressed }

class ButtonA extends SpriteGroupComponent with Tappable {
  ButtonA({required this.spriteSheet})
      : super(
            sprites: {
              ButtonState.pressed: Sprite(spriteSheet.last),
              ButtonState.unpressed: Sprite(spriteSheet.first)
            },
            current: ButtonState.unpressed,
            size: Vector2(39, 33),
            position: Vector2(100, 100));

  List<Image> spriteSheet;

  @override
  bool onTapUp(TapUpInfo infos) {
    this.current = ButtonState.pressed;

    return false;
  }

  @override
  bool onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    this.current = ButtonState.unpressed;
    return false;
  }
}
