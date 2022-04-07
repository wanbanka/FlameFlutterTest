import 'package:flutter/material.dart';
import 'package:flame/game.dart' show FlameGame, HasDraggables;
import 'package:flame/components.dart' show Component;
/**
 * Génère la configuration d'un jeu (sprites, backgrounds...)
 */

class MyGame extends FlameGame with HasDraggables {
  MyGame({required this.sprites}) : super();

  List<Component> sprites;

//Initialisation du jeu

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    print("OnLoad");

    this.sprites.forEach((sprite) async {
      await add(sprite);
    });
  }
}
