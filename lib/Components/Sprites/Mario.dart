import 'dart:ui' show Image;

import 'package:flame/components.dart'
    show
        SpriteAnimationGroupComponent,
        SpriteAnimation,
        SpriteAnimationData,
        Vector2,
        Draggable;

import 'package:flame/input.dart' show DragStartInfo, DragEndInfo;

enum MarioState { normal, scared }

//Draggable: rend l'élément interactif avec un drag and drop

class Mario extends SpriteAnimationGroupComponent with Draggable {
  Mario({required this.spriteSheet})
      : super(
            size: //Toujours spécifier la taille du sprite, sinon pas d'affichage
                Vector2(35, 43),
            position: Vector2(250, 250),
            animations: //Toutes les animations disponibles pour le sprite
                // en fonction de l'état de celui-ci
                {
              MarioState.normal: SpriteAnimation.fromFrameData(
                  spriteSheet.first,
                  SpriteAnimationData.sequenced(
                      amount: 1, stepTime: 0.1, textureSize: Vector2(35, 43))),
              MarioState.scared: SpriteAnimation.fromFrameData(
                  spriteSheet.last,
                  SpriteAnimationData.sequenced(
                      amount: 3, stepTime: 0.1, textureSize: Vector2(35, 43)))
            },
            current: //Etat actuel du sprite
                MarioState.normal);

  late List<Image> spriteSheet;

  @override
  bool onDragStart(DragStartInfo infos) {
    this.current = MarioState.scared;

    return false;
  }

  @override
  bool onDragEnd(DragEndInfo infos) {
    this.current = MarioState.normal;

    return false;
  }
}
