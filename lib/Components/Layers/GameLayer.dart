import 'package:flame/layers.dart';

import '../Worlds/World1.dart';

class GameLayer extends DynamicLayer {
  World1 world;

  GameLayer({required this.world}) {
    preProcessors.add(ShadowProcessor());
  }

  @override
  void drawLayer() {
    // TODO: implement drawLayer

    this.world.sprites.forEach((sprite) {
      sprite.render(canvas);
    });
  }
}
