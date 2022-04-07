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

  Future<List<Image>> loadSeveralPictures(List<String> pictures) async {
    return await this.flameService.loadSeveralPictures(pictures);
  }

  /**
   * Select randomly an audio file in the selection
   */

  Future<void> randomAudio(List<String> audios) async {
    var rng = Random();

    await this.flameService.loadOneAudio(audios[rng.nextInt(audios.length)]);
  }
}
