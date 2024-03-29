import 'package:dartz/dartz.dart';
import 'package:firebase_dd_course/domain/core/entity.dart';
import 'package:firebase_dd_course/domain/core/failures.dart';
import 'package:firebase_dd_course/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem with _$TodoItem implements IEntity {
  const factory TodoItem({
    @required UniqueId id,
    @required TodoName name,
    @required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );
}

extension TodoItemX on TodoItem {
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold((f) => some(f), (_) => none());
  }
}