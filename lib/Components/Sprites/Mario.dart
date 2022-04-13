import 'dart:ui' show Image;

import 'package:flame/components.dart'
    show
        SpriteAnimationGroupComponent,
        PositionComponent,
        SpriteAnimation,
        SpriteAnimationData,
        Vector2,
        Draggable,
        HasGameRef;

import 'package:flame/collisions.dart'
    show CollisionCallbacks, ScreenHitbox, RectangleHitbox, CollisionType;

import 'package:flame/input.dart' show DragStartInfo, DragEndInfo;

enum MarioState { normal, scared }

//Draggable: rend l'élément interactif avec un drag and drop

class Mario extends SpriteAnimationGroupComponent
    with Draggable, CollisionCallbacks, HasGameRef {
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
              MarioState.normal,
        );

  late List<Image> spriteSheet;

  int xPlus = 1, yPlus = -1;

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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    if (other is ScreenHitbox) {
      this.current = MarioState.scared;

      Vector2 intersectPoint = intersectionPoints.firstWhere(
          (point) => point.x >= this.position.x || point.y >= this.position.y);

      if (this.position.x + xPlus > intersectPoint.x ||
          this.position.x + xPlus < 0) {
        xPlus = -xPlus;
      }

      if (this.position.y + yPlus > intersectPoint.y ||
          this.position.y + yPlus < 0) {
        yPlus = -yPlus;
      }

      print("Plus: $xPlus, $yPlus");
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    // TODO: implement onCollisionEnd

    Future.delayed(Duration(milliseconds: 3500), () {
      this.current = MarioState.normal;
    });
  }

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    await add(RectangleHitbox());
  }

  //Met à jour le composant présent dans le canvas

  @override
  void update(double dt) {
    // TODO: implement update

    this.position.x += xPlus;
    this.position.y += yPlus;

    super.update(dt);
  }
}
