import 'package:bloc_examples/firestore_todos/models/models.dart';
import 'package:bloc_examples/firestore_todos/repositories/todos/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredTodosState extends Equatable {
  const FilteredTodosState();

  @override
  List<Object> get props => [];
}

class FilteredTodosLoading extends FilteredTodosState {}

class FilteredTodosLoaded extends FilteredTodosState {
  final List<Todo> filteredTodos;
  final VisibilityFilter activeFilter;

  const FilteredTodosLoaded(
    this.filteredTodos,
    this.activeFilter,
  );

  @override
  List<Object> get props => [filteredTodos, activeFilter];

  @override
  String toString() {
    return 'FilteredTodosLoaded { filteredTodos: $filteredTodos, activeFilter: $activeFilter }';
  }
}
