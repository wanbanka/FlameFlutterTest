import 'package:flame/components.dart'
    show ParallaxComponent, Vector2, PositionType;

import 'package:flame/image_composition.dart' show ImageComposition;

import 'package:flame/parallax.dart';

import 'dart:ui' show Image, Rect;

import 'package:flutter/material.dart' as Ma;

class MyParallax extends ParallaxComponent {
  MyParallax({required this.elements, this.composition}) : super();

  List<Image> elements;

  List<Image>? composition;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    var compositionFinal = ImageComposition();

    if (this.composition != null) {
      compositionFinal = ImageComposition()
        ..add(this.composition!.first, Vector2.zero())
        ..add(this.composition![1], Vector2(64, 0))
        ..add(this.composition!.last, Vector2(128, 0),
            source: Rect.fromLTWH(32, 32, 64, 64));
    }

    var images = [
      ParallaxImage(elements.first,
          alignment: Ma.Alignment.center,
          repeat: Ma.ImageRepeat.repeat,
          fill: LayerFill.height),
      ParallaxImage(elements[1],
          alignment: Ma.Alignment.bottomCenter, fill: LayerFill.none)
    ];

    if (this.composition != null) {
      images.add(ParallaxImage(await compositionFinal.compose()));
    }

    final layers = images.map((image) {
      return ParallaxLayer(image);
    });

    parallax = Parallax(layers.toList());
  }
}
