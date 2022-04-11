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
      ParallaxImage(elements.first,
          alignment: Ma.Alignment.center,
          repeat: Ma.ImageRepeat.repeat,
          fill: LayerFill.height),
      ParallaxImage(elements[1],
          alignment: Ma.Alignment.bottomCenter, fill: LayerFill.none),
    ];

    final layers = images.map((image) {
      return ParallaxLayer(image,
          velocityMultiplier: Vector2.all((images.indexOf(image) + 1) * 2.0));
    });

    parallax = Parallax(layers.toList(), baseVelocity: Vector2(50, 0));
  }
}
