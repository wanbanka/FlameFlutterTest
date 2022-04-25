import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/components.dart'
    show Vector2, SpriteAnimationGroupComponent, Anchor;

class BirdBody extends BodyComponent {
  BirdBody({required this.bird});

  SpriteAnimationGroupComponent bird;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad

    await super.onLoad();

    await add(bird);
  }

  @override
  Body createBody() {
    // TODO: implement createBody

    final shape = PolygonShape()
      ..set([
        Vector2(this.bird.position.x, this.bird.position.y),
        Vector2(this.bird.position.x - this.bird.size.x, this.bird.position.y),
        Vector2(this.bird.position.x - this.bird.size.x,
            this.bird.position.y + this.bird.size.y),
        Vector2(this.bird.position.x, this.bird.position.y + this.bird.size.y)
      ]);

    final fixtureDef = FixtureDef(shape)
      ..restitution = 0
      ..density = 0
      ..friction = 0
      ..isSensor = true; //isSensor: lors d'une collision avec un autre
    //objet, ne renvoie pas de réponse à la collision

    final bodyDef = BodyDef()
      ..type = BodyType.kinematic
      ..userData = this;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
