import 'package:flame/experimental.dart' show CameraComponent, World;

class Camera1 extends CameraComponent {
  Camera1({required this.worldToWatch}) : super(world: worldToWatch);

  World worldToWatch;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad

    await add(this.worldToWatch);
  }
}
