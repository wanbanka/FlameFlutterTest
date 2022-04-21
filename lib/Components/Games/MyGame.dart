import 'package:flutter/material.dart' show TextStyle, Colors;

import 'package:flame/game.dart'
    show
        FlameGame,
        HasDraggables,
        HasTappables,
        HasCollisionDetection,
        TextPaint;

import 'package:flame/components.dart';

import 'package:flame/experimental.dart' show CameraComponent;

import 'package:flame/input.dart'
    show
        TapUpInfo,
        TapDownInfo,
        TapDetector,
        ScaleDetector,
        ScaleStartInfo,
        ScaleUpdateInfo,
        ScaleEndInfo,
        DragStartInfo;

import 'dart:ui' show Canvas;

/**
 * Génère la configuration d'un jeu (sprites, backgrounds...)
 */

//HasDraggables: possibilités de faire des drag and drop

class MyGame extends FlameGame
    with HasDraggables, HasTappables, HasCollisionDetection, ScaleDetector {
  MyGame({
    required this.cameras,
  }) : super();

  List<CameraComponent> cameras;

  late double startZoom;

//Initialisation du jeu

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    print("OnLoad");

    this.cameras.forEach((element) async {
      await add(element);
    });

    debugMode = true;
  }

  @override
  void onScaleStart(ScaleStartInfo info) {
    // TODO: implement onScaleStart

    startZoom = camera.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    // TODO: implement onScaleUpdate

    final currentScale = info.scale.global;

    if (!currentScale.isIdentity()) {
      camera.zoom = startZoom * currentScale.y;
    } else {
      camera.translateBy(-info.delta.game);
      camera.snap();
    }
  }
}
