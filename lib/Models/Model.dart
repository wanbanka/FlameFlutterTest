class Model {
  int _integer = 0;
  int get integer => this._integer;

  set integer(int value) => this._integer = value;

  int incrementCounter() => ++this._integer;
}
