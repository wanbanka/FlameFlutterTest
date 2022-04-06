import 'package:flame/components.dart'
    show SpriteComponent, Sprite, Vector2, Anchor;

/**
 * Génère un sprite
 */

class MyCrate extends SpriteComponent {
  MyCrate()
      : super(
            size: //Etire le sprite à la taille souhaitée
                Vector2.all(64),
            anchor: //Position relative du sprite sur l'écran
                Anchor.center);

//Méthode d'initialisation du composant (ici pour modifier la
//variable sprite)

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    sprite = await Sprite.load("Idle.png");
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
