import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

import 'dart:ui' show Image;

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

/**
 * Load and return a picture (sprite sheet, elements...)
 */

  Future<Image> loadOnePicture(String picture) async {
    return await Flame.images.load(picture);
  }

  /**
   * Load an audio file (fx, voice...)
   */

  Future<void> loadOneAudio(String audio) async {
    await FlameAudio.play(audio);
  }

  /**
   * Load several elements
   */

  Future<Map<String, Image>> loadSeveralPictures(
      Map<String, String> pictures) async {
    Map<String, Image> mapFinal = {};

    List<Image> images = await Future.wait(pictures.values.map((value) async {
      return await this.loadOnePicture(value);
    }));

    int valIndex = 0;

    pictures.keys.forEach((key) {
      mapFinal.addAll({key: images[valIndex]});

      valIndex++;
    });

    return Future.value(mapFinal);
  }
}
