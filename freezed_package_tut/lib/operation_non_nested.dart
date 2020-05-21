import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_non_nested.freezed.dart';

@freezed
abstract class OperationNonNested with _$OperationNonNested {
  // "Non-nested" unions have public generated classes (no underscore)
  const factory OperationNonNested.add(int value) = Add;
  const factory OperationNonNested.subtract(int value) = Subtract;
}