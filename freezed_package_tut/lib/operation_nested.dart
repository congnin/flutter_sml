import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_nested.freezed.dart';

@freezed
abstract class OperationNested with _$OperationNested {
  // "Nested" unions have private generated classes (underscore)
  const factory OperationNested.add(int value) = _Add;
  const factory OperationNested.subtract(int value) = _Subtract;
}