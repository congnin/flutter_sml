extension Silly on String {
  void scream() => print(toUpperCase());
}

extension Sillier on int {
  void times(Function f) {
    for (int i = 0; i < this; i++) {
      f();
    }
  }
}

extension Silliest on Object {
  int nah() => hashCode + 42;
  String stop(String x) => toString() + x;
  Type please() => runtimeType;
  bool notAgain(Object other) => this != other;
  // ...
}
