import 'package:flame/components.dart'
    show SpriteComponent, Sprite, Vector2, Anchor;

/**
 * Génère un sprite
 */

class MyCrate extends SpriteComponent {
  MyCrate() : super();

  void walk({required bool forward, double? x, double? y}) {
    print("Coords: $x, $y");

    this.position.x += forward ? (x ?? 0) : -(x ?? 0);

    this.position.y += forward ? (y ?? 0) : -(y ?? 0);
  }

//Méthode d'initialisation du composant (ici pour modifier la
//variable sprite)

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    sprite = await Sprite.load("Idle.png");

    size = //Etire le sprite à la taille souhaitée
        Vector2(128, 64);
    anchor = //Position relative du sprite sur l'écran
        Anchor.center;
  }

//Modifie le composant lors du changement de taille
//(modification de la variable position du sprite)

  @override
  void onGameResize(Vector2 size) {
    // TODO: implement onGameResize
    super.onGameResize(size);

    position = size / 2;
  }
}
