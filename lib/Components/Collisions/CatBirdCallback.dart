import 'package:flame_forge2d/flame_forge2d.dart';

import '../Sprites/CatBody.dart';
import '../Sprites/BirdBody.dart';

//ContactCallback: permet de gérer la collision entre deux
//corps et comment gérer ces collisions (début, fin...)

class CatBirdCallback extends ContactCallback<CatBody, BirdBody> {
  double _totalImpactImpulse = 0;

  int _contactCounter = 1;

  @override
  void begin(CatBody a, BirdBody b, Contact contact) {
    _totalImpactImpulse = 0;

    _contactCounter = 1;

    contact.manifold.points.forEach((point) {
      print("Local point: ${point.localPoint}");
    });

    var worldContact = WorldManifold();

    contact.getWorldManifold(worldContact);

    print("World points: ${worldContact.points}");

    final cat = a.body.linearVelocityFromWorldPoint(worldContact.points[0]);

    final bird = b.body.linearVelocityFromWorldPoint(worldContact.points[0]);

    print("Impact velocity: ${cat - bird}");

    a.speak();
  }

  @override
  void postSolve(
      CatBody a, BirdBody b, Contact contact, ContactImpulse impulse) {
    // TODO: implement postSolve

    _totalImpactImpulse += impulse.normalImpulses[0].abs();

    _contactCounter++;
  }

  @override
  void end(CatBody a, BirdBody b, Contact contact) {
    // TODO: implement end

    print(
        "End of contact: impulse $_totalImpactImpulse and counter $_contactCounter");
  }
}
