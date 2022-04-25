import 'package:flame/experimental.dart' show World;

import 'package:flame/components.dart'
    show ParallaxComponent, Component, ParticleSystemComponent;

class World1 extends World {
  World1({required this.parallax, required this.particles});

  List<ParallaxComponent> parallax;

  List<ParticleSystemComponent> particles;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    List<dynamic> loadedElements = [...this.parallax, ...this.particles];

    loadedElements.forEach((element) async {
      await add(element);
    });
  }
}
