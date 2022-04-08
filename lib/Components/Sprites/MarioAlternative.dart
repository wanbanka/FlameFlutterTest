import 'dart:ui' show Image;

import 'package:flame/components.dart'
    show
        SpriteAnimationComponent,
        SpriteAnimationGroupComponent,
        SpriteAnimation,
        SpriteAnimationData,
        Vector2,
        Draggable;

import 'package:flame/input.dart' show DragStartInfo, DragEndInfo;

enum MarioState { normal, scared }

//Draggable: rend l'élément interactif avec un drag and drop

class Mario extends SpriteAnimationComponent with Draggable {
  Mario({required this.spriteSheet, required this.onDragAudio})
      : super(
            size: //Toujours spécifier la taille du sprite, sinon pas d'affichage
                Vector2(35, 43),
            position: Vector2(250, 250)) {
    this.animation = //Animation contenant toutes les frames d'un sprite sheet
        SpriteAnimation.fromFrameData(
            spriteSheet.first,
            //Comment réaliser l'animation (nombre de sprites, intervalle de temps entre 2 sprites,
            //taille du sprite). Bien vérifier la taille du sprite sheet et calculer la taille des
            //différents sprites de l'animation
            SpriteAnimationData.sequenced(
                amount: 1, stepTime: 0.1, textureSize: Vector2(35, 43)));
  }

  late List<Image> spriteSheet;

  late Function onDragAudio;

  @override
  bool onDragStart(DragStartInfo infos) {
    this.animation = SpriteAnimation.fromFrameData(
        spriteSheet.last,
        SpriteAnimationData.sequenced(
            amount: 3, stepTime: 0.1, textureSize: Vector2(35, 43)));

    this.onDragAudio();

    return false;
  }

  @override
  bool onDragEnd(DragEndInfo infos) {
    this.animation = SpriteAnimation.fromFrameData(
        spriteSheet.first,
        SpriteAnimationData.sequenced(
            amount: 1, stepTime: 0.1, textureSize: Vector2(35, 43)));

    return false;
  }
}
