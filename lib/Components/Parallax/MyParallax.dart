import 'package:flame/components.dart' show ParallaxComponent, Vector2;
import 'package:flame/parallax.dart';

import 'dart:ui' show Image;

import 'package:flutter/material.dart' as Ma;

class MyParallax extends ParallaxComponent {
  MyParallax({required this.elements}) : super();

  List<Image> elements;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    final images = [
      ParallaxImage(elements[1],
          repeat: Ma.ImageRepeat.repeat,
          alignment: Ma.Alignment.center,
          fill: LayerFill.width),
      ParallaxImage(elements.last,
          repeat: Ma.ImageRepeat.repeatY,
          alignment: Ma.Alignment.bottomLeft,
          fill: LayerFill.none),
      ParallaxImage(elements.first,
          repeat: Ma.ImageRepeat.repeatX,
          alignment: Ma.Alignment.topRight,
          fill: LayerFill.height)
    ];

    final layers = images.map((image) {
      return ParallaxLayer(image,
          velocityMultiplier: Vector2.all(images.indexOf(image) * 2.0));
    });

    parallax = Parallax(layers.toList(), baseVelocity: Vector2(50, 0));
  }
}
