import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/game.dart' show HasTappables, HasDraggables;

import 'package:flame/components.dart'
    show Vector2, HasCollisionDetection, SpriteAnimationGroupComponent;

import '../Sprites/CatBody.dart';
import '../Sprites/BirdBody.dart';

import '../Collisions/CatBirdCallback.dart';

class ForgeGame extends Forge2DGame
    with HasCollisionDetection, HasDraggables, HasTappables {
  ForgeGame({required this.cat, required this.bird})
      : super(gravity: Vector2(10.0, 0), zoom: 1) {
    this.catBody = CatBody(cat: cat);
    this.birdBody = BirdBody(bird: bird);
  }

  BodyComponent? catBody, birdBody;

  SpriteAnimationGroupComponent cat;

  SpriteAnimationGroupComponent bird;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

/*
Dans un jeu de type ForgeGame, il est obligatoire d'ajouter
des BodyComponents et des ContactCallbacks
*/

    await add(this.catBody!);

    await add(this.birdBody!);

    addContactCallback(CatBirdCallback());

    debugMode = true;
  }
}
