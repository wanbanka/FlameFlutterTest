import 'package:flutter/material.dart' show Colors;

import 'package:flame/components.dart' show ParticleSystemComponent, Vector2;

import 'package:flame/particles.dart';

import 'dart:ui' show Paint, Offset;

import 'dart:math';

class Particle1 extends ParticleSystemComponent {
  Particle1() : super(position: Vector2.all(200)) {
    Random rnd = Random();

    Vector2 randomVector2() =>
        (Vector2.random(rnd) - Vector2.random(rnd)) * 200;

    this.particle = Particle.generate(
        count: 100,
        lifespan: 10,
        generator: (i) {
          Vector2 position = Vector2.zero(), speed = Vector2.zero();

          final acceleration = randomVector2();

          final paint = Paint()..color = Colors.red;

          return AcceleratedParticle(
              speed: randomVector2(),
              child: CircleParticle(paint: paint, radius: 15));
        });
  }
}
