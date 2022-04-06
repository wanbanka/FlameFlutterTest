import 'package:mvc_application/controller.dart' show ControllerMVC;
import '../Models/Model.dart';

class Controller extends ControllerMVC {
  factory Controller() => _this ??= Controller._();

  Controller._()
      : model = Model(),
        super();

  static Controller? _this;

  final Model model;

  int get counter => model.integer;

  void incrementCounter() => model.incrementCounter();
}
