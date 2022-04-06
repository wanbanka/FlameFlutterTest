import 'package:flutter/material.dart';
import 'package:flame/game.dart' show FlameGame;
import 'package:flame/components.dart' show Component;

/**
 * Génère la configuration d'un jeu (sprites, backgrounds...)
 */

class MyGame extends FlameGame {
  MyGame({required this.sprites}) : super();

  List<Component> sprites;

//Initialisation du jeu

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    this.sprites.forEach((sprite) async {
      await add(sprite);
    });
  }

  //Change la couleur d'arrière-plan du jeu

  @override
  Color backgroundColor() {
    // TODO: implement backgroundColor
    return Color(0x000000);
  }
}
