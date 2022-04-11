import 'package:flame/geometry.dart' show PolygonComponent;
import 'package:flame/components.dart' show Vector2;

class Polygon extends PolygonComponent {
  Polygon()
      : super.relative(
            [Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)],
            parentSize: Vector2.all(100));
}
