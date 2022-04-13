import 'package:flame/game.dart'
    show FlameGame, HasDraggables, HasTappables, HasCollisionDetection;
import 'package:flame/components.dart'
    show PositionComponent, ParallaxComponent, IsometricTileMapComponent;
import 'package:flame/geometry.dart' show ShapeComponent;

import 'package:flame/collisions.dart' show ScreenHitbox;

/**
 * Génère la configuration d'un jeu (sprites, backgrounds...)
 */

//HasDraggables: possibilités de faire des drag and drop

class MyGame extends FlameGame
    with HasDraggables, HasTappables, HasCollisionDetection {
  MyGame(
      {required this.sprites,
      required this.parallax,
      required this.shapes,
      required this.tilesets})
      : super();

  List<PositionComponent> sprites;

  List<ParallaxComponent> parallax;

  List<ShapeComponent> shapes;

  List<IsometricTileMapComponent> tilesets;

//Initialisation du jeu

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    print("OnLoad");

    List<dynamic> loadingElements = [
      ...this.parallax,
      ...this.tilesets,
      ...this.sprites,
      ...this.shapes
    ];

    loadingElements.forEach((element) async {
      await add(element);
    });

    await add(ScreenHitbox());
  }
}
