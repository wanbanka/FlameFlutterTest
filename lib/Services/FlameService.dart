import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

import 'dart:ui' show Image;

/**
 * Service for handling the game's logic
 */

class FlameService {
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
