import 'package:flutter/material.dart';
import 'package:flame/game.dart' show FlameGame, HasDraggables, HasTappables;
import 'package:flame/components.dart'
    show Component, ParallaxComponent, IsometricTileMapComponent;
import 'package:flame/geometry.dart' show ShapeComponent;
/**
 * Génère la configuration d'un jeu (sprites, backgrounds...)
 */

//HasDraggables: possibilités de faire des drag and drop

class MyGame extends FlameGame with HasDraggables, HasTappables {
  MyGame(
      {required this.sprites,
      required this.parallax,
      required this.shapes,
      required this.tilesets})
      : super();

  List<Component> sprites;

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
  }
}
