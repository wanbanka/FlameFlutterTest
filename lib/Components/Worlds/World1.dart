import 'package:flame/experimental.dart' show World;

import 'package:flame/components.dart' show ParallaxComponent, Component;

class World1 extends World {
  World1({required this.parallax, required this.sprites});

  List<ParallaxComponent> parallax;

  List<Component> sprites;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    List<dynamic> loadedElements = [...this.parallax, ...this.sprites];

    loadedElements.forEach((element) async {
      await add(element);
    });
  }
}
