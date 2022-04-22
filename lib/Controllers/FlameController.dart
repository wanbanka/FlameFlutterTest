import 'package:mvc_application/controller.dart' show ControllerMVC;
import 'dart:ui' show Image;
import 'dart:math';

import '../Services/FlameService.dart';

/**
 * Controller handling games and resources
 */

class FlameController extends ControllerMVC {
  factory FlameController() => _this ??= FlameController._();

  FlameController._();

  static FlameController? _this;

  FlameService flameService = FlameService();

  /**
   * Load a picture in order to make a sprite or an animation
   */

  Future<Image> loadOnePicture(String picture) async {
    return await this.flameService.loadOnePicture(picture);
  }

  /**
   * Load several elements
   */

  Future<Map<String, Image>> loadSeveralPictures(
      Map<String, String> pictures) async {
    return await this.flameService.loadSeveralPictures(pictures);
  }

  /**
   * Select randomly an audio file in the selection
   */

  Future<void> randomAudio(List<String> audios) async {
    var rng = Random();

    await this.flameService.loadOneAudio(audios[rng.nextInt(audios.length)]);
  }

/**
 * Play and loop music in background
 */

  Future<void> playBackgroundMusic(String audio) async {
    await flameService.loadBackgroundMusic(audio);
  }

  /**
   * Resume or pause the bg music
   */

  Future<void> resumeOrPauseBgMusic({required bool paused}) async {
    await flameService.resumeOrPauseBgMusic(paused: paused);
  }

/**
 * Dispose the background audio
 */

  void disposeBgAudio() {
    flameService.disposeBgAudio();
  }
}
