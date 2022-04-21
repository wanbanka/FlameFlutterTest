import 'package:flutter/material.dart' show Colors, TextStyle;

import 'package:flame/game.dart' show TextPaint;
import 'package:flame/components.dart'
    show TextBoxComponent, TextBoxConfig, Vector2, Tappable, HasGameRef;

import 'package:flame/input.dart' show TapUpInfo, TapDownInfo;

import 'dart:ui' show Canvas, Rect, Paint, PaintingStyle;

class MyTextBox extends TextBoxComponent with Tappable, HasGameRef {
  MyTextBox(String text)
      : super(
            text: text,
            position: Vector2(100, 500),
            textRenderer: TextPaint(style: TextStyle(color: Colors.black)),
            boxConfig: TextBoxConfig(timePerChar: 0.05));

  @override
  void drawBackground(Canvas c) {
    // TODO: implement drawBackground

    Rect rect = Rect.fromLTWH(0, 0, width, height);

    c.drawRect(rect, Paint()..color = Colors.white);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp

    gameRef.resumeEngine();

    gameRef.remove(this);

    return false;
  }
}
