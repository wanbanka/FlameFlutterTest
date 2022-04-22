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
 * Load and loop in background an audio file
 */

  Future<void> loadBackgroundMusic(String audio) async {
    FlameAudio.bgm.initialize();

    await FlameAudio.bgm.load(audio);

    await FlameAudio.bgm.play(audio, volume: 0.25);
  }

  /**
   * Resume or pause the bg music
   */

  Future<void> resumeOrPauseBgMusic({required bool paused}) async {
    await (paused ? FlameAudio.bgm.resume() : FlameAudio.bgm.pause());
  }

/**
 * Dispose the background music
 */

  void disposeBgAudio() {
    FlameAudio.bgm.dispose();
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
