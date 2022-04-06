import 'package:flame/game.dart' show GameWidget, Game;

/**
 * Plateau de jeu récupérant les différentes configurations
 * de ce jeu
 */

class SetWidget1 extends GameWidget {
  SetWidget1({required this.game}) : super(game: game);

  final Game game;
}
