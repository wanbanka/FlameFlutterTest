import 'package:flame/geometry.dart' show CircleComponent;
import 'package:flame/components.dart' show Vector2, Anchor;

class Circle extends CircleComponent {
  Circle() : super.relative(0.8, parentSize: Vector2.all(100));
}
