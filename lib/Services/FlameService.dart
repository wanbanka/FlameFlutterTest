import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

/**
 * Service for handling the game's logic
 */

class FlameService {
/**
 * Load all assets needed for the game
 */

  static Future<void> loadAssets(List<String> assets) async {
    assets.forEach((asset) async {
      var splitName = asset.split(".").last;

      print(asset);

      splitName == "png"
          ? await Flame.images.load(asset)
          : await FlameAudio.play(asset);
    });
  }
}
