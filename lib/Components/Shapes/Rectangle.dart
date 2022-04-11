import 'package:flame/geometry.dart' show RectangleComponent;
import 'package:flame/components.dart' show Vector2, Anchor;

class Rectangle extends RectangleComponent {
  Rectangle() : super.square(position: Vector2.all(200), size: 200);
}
