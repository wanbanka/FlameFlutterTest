import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../States/InventoryState.dart';

class InventoryBloc extends Cubit<InventoryState> {
  InventoryBloc() : super(InventoryState(Weapon.notGot));

  InventoryState iState = InventoryState(Weapon.notGot);

  void addWeapon() {
    this.iState.weapon = Weapon.got;

    emit(this.iState);
  }
}
