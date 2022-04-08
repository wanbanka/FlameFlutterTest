import 'package:flutter/material.dart';
import 'package:flame/game.dart' show FlameGame, HasDraggables, HasTappables;
import 'package:flame/components.dart' show Component, ParallaxComponent;
/**
 * Génère la configuration d'un jeu (sprites, backgrounds...)
 */

//HasDraggables: possibilités de faire des drag and drop

class MyGame extends FlameGame with HasDraggables, HasTappables {
  MyGame({required this.sprites, required this.parallax}) : super();

  List<Component> sprites;

  List<ParallaxComponent> parallax;

//Initialisation du jeu

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    print("OnLoad");

    this.parallax.forEach((parallax) async {
      await add(parallax);
    });

    this.sprites.forEach((sprite) async {
      await add(sprite);
    });
  }
}
