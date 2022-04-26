enum Weapon { got, notGot }

class InventoryState {
  Weapon _weapon;

  Weapon get weapon => this._weapon;

  set weapon(Weapon value) => this._weapon = value;

  InventoryState(this._weapon);
}
