import 'package:freezed_package_tut/freezed_classes.dart';

import 'operation_nested.dart';
import 'operation_non_nested.dart';

void main() {
  final user = User('Matt', 20);
  // user.age = 5; // error, User is immutable
  final user2 = user.copyWith(name: 'John');

  final sameValueUser1 = User('abc', 123);
  final sameValueUser2 = User('abc', 123);
  print(sameValueUser1 == sameValueUser2); // true

  print(user);

  // json
  final Map<String, dynamic> serialized = user.toJson();
  print(serialized);
  final User deserialized = User.fromJson(serialized);
  print(deserialized);

  // operation nested
  final result = performOperation(2, OperationNested.add(2));
  print(result); // 4

  // operation non nested
  // Still possible to use the factory
  final result1 = performOperationNon(2, OperationNonNested.add(2));
  // But non-nested union cases can also be instantiated directly
  final result2 = performOperationNon(2, Add(2));

  print(result1); // 4
  print(result2); // 4
}

// Function pretending to do something useful
int performOperation(int operand, OperationNested operation) {
  // Like switch statement but forgetting about a case will result in info/error
  return operation.when(
    add: (value) => operand + value,
    subtract: (value) => operand - value,
  );
}


int performOperationNon(int operand, OperationNonNested operation) {
  // When method still works even with cases instantiated directly
  return operation.when(
    add: (value) => operand + value,
    subtract: (value) => operand - value,
  );
}
