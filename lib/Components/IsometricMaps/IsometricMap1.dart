import 'package:flame/components.dart' show IsometricTileMapComponent, Vector2;
import 'package:flame/sprite.dart' show SpriteSheet;

import 'dart:ui' show Image;

class IsometricMap1 extends IsometricTileMapComponent {
  IsometricMap1({required this.tilesetMap})
      : super(
          SpriteSheet(
              image: tilesetMap,
              srcSize: //Taille d'un sprite du tileset
                  Vector2.all(64)),
          //Matrice regroupant les ids des différents sprites
          //du tileset (le numéro 0 est le premier sprite en haut à gauche du
          //tileset, puis on incrémente l'id en allant de gauche à droite)
          //Matrice sous la forme de lignes et de colonnes de cases
          [
            [4, 4, 4, 4],
            [5, 5, 5, 10, 47],
            [13, 15, 16, 42],
            [54, 54, 54, 54, 61, 84, 84]
          ],
          position: Vector2(100, 250),
        );

  Image tilesetMap;
}
