import 'package:equatable/equatable.dart';
import 'package:flutter_todos/features/todos/models/todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({
    this.todos = const [],
  });

  TodoState copyWith({
    List<Todo>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [todos];
}
