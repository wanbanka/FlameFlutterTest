import 'package:flame/components.dart' show PositionComponent, Vector2, Anchor;
import 'package:flutter/material.dart' show Color, BlendMode;
import 'package:flutter/widgets.dart' show Canvas, RRect, Rect, Radius, Paint;

class Position1 extends PositionComponent {
  @override
  Future<void>? onLoad() async {
    position = Vector2(0, 0);

    angle = 45;

    anchor = Anchor.center;

    // TODO: implement onLoad
    final parent = PositionComponent(
        position: Vector2(100, 100),
        size: Vector2(200, 200),
        anchor: Anchor.center);

    final child = PositionComponent(position: Vector2(0, -50));

    await parent.add(child);
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    flipVertically();
  }

  @override
  Rect toRect() {
    // TODO: implement toRect
    return Rect.fromLTRB(0, 0, 300, 300);
  }
}
