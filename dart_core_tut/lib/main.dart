import './extension/basic_type_extensions.dart';
import 'dart:math' show pi;

void main() {
  bool valid = StringUtil.isValidEmail('someString');
  print('Email is valid: $valid');

  bool valid2 = 'congnguyen@email.com'.isValidEmail;
  print('Email is valid 2: $valid2');

  //concat
  String v = 'one'.concatWithSpace('two');
  String v1 = 'one' & 'two';
  print('Concat 1: $v');
  print('Concat 2: $v1');

  //num
  int anInt = 1.addTen();
  // Run-time error!
  // Putting a 'num' which is really a 'double' into an 'int' variable
  double shouldBeDouble = 1.0.addTen();
  print('result num: $anInt');
  print('result double: $shouldBeDouble');

  var warning = "Extensions are here!";
  warning.scream();
  5.times(() => print('hello'));
  print(null.stop('!!!'));
  print('Extension methods are here!'.toUpperCase());
  for (var i = 0; i < 3; i++) {
    print('Hurray!');
  }
  print('π = $pi');

  print([1, 2, 3].sum);
}

class StringUtil {
  static bool isValidEmail(String str) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(str);
  }
}

extension StringExtensions on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  String concatWithSpace(String other) {
    return '$this $other';
  }

  /// DOCUMENTATION IS SUPPORTED: Concatenates two strings with a space in between.
  String operator &(String other) => '$this $other';
}

extension NumExtensions on num {
  num addTen() => this + 10;
}

extension on List<int> {
  int get sum => fold(0, (a, b) => a + b);
}
