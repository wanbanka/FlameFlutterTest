import 'package:flame_forge2d/flame_forge2d.dart';

import '../Sprites/CatBody.dart';
import '../Sprites/BirdBody.dart';

//ContactCallback: permet de gérer la collision entre deux
//corps et comment gérer ces collisions (début, fin...)

class CatBirdCallback extends ContactCallback<CatBody, BirdBody> {
  @override
  void begin(CatBody a, BirdBody b, Contact contact) {
    a.speak();
  }

  @override
  void end(CatBody a, BirdBody b, Contact contact) {
    // TODO: implement end
  }
}
