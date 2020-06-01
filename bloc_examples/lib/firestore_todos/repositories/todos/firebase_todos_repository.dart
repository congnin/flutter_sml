import 'package:bloc_examples/firestore_todos/repositories/todos/entities/entities.dart';
import 'package:bloc_examples/firestore_todos/repositories/todos/models/todo.dart';
import 'package:bloc_examples/firestore_todos/repositories/todos/todos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodosRepository implements TodosRepository {
  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(Todo todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    return todoCollection.document(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Todo.fromEntity(TodoEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return todoCollection
        .document(todo.id)
        .updateData(todo.toEntity().toDocument());
  }
}
