import 'dart:async';

import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/components.dart'
    show Vector2, SpriteAnimationGroupComponent, Anchor, Draggable, Tappable;

import 'package:flame/input.dart' show TapUpInfo;

import '../TextBoxes/MyTextBox.dart';
import 'Cat.dart';

//BodyComponent: composant répertoriant les propriétés
//physiques (forces, masses...) d'un objet (attention:
//il n'y a pas de visuels dans un BodyComponent, il faut
//les rajouter)

class CatBody extends BodyComponent with Draggable, Tappable {
  CatBody({required this.cat});

  SpriteAnimationGroupComponent cat;

  bool visited = false;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad

    await super.onLoad();

    await add(cat);
  }

  //Permet de créer la définition de la hitbox
  //du composant

  @override
  Body createBody() {
    // TODO: implement createBody

    var width = (this.cat as Cat).widthCat,
        height = (this.cat as Cat).heightCat;

    final shape = PolygonShape()
      ..set([
        Vector2(0, 400),
        Vector2(width, 400),
        Vector2(width, 400 + height),
        Vector2(0, 400 + height)
      ]);

    //FixtureDef: permet de définir
    //la forme de la hitbox et les propriétés
    //de forces et de résistances de l'objet

    final fixtureDef = FixtureDef(shape)
      ..restitution = 0.8
      ..density = 1.0
      ..friction = 0.2;

    //Définition du corps

    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      //Type: trois types d'objets:
      // - Statiques: pas de masse et de vélocité, répond à des forces (ex: sol...)
      // - Cinématiques: pas de masse et aucune force, mais a une vélocité (ex: plateforme
      // mobile...)
      // - Dynamiques: a une masse, une vitesse, et répond à des forces (ex: joueur...)

      //Pas de collisions entre statiques et cinématiques.
      //Dynamiques en collision avec tous les types de corps
      ..userData = this; //UserData: Détermine l'objet pour la collision

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  void speak() async {
    if (!visited) {
      var textBox = MyTextBox("Tiens, un oiseau ! Je vais le manger");

      await gameRef.add(textBox);

      visited = true;
    }
  }

  @override
  bool onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp

    body.position.x += 50;

    return true;
  }
}
