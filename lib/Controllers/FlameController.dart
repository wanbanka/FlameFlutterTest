import 'package:mvc_application/controller.dart' show ControllerMVC;
import 'package:flame/components.dart' show Component;

import '../Components/Games/MyGame.dart';

/**
 * Controller handling games and resources
 */

class FlameController extends ControllerMVC {
  factory FlameController() => _this ??= FlameController._();

  FlameController._();

  static FlameController? _this;
}
