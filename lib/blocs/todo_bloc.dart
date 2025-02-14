import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/features/todos/bloc/todo_event.dart';
import 'package:flutter_todos/features/todos/bloc/todo_state.dart';
import 'package:flutter_todos/models/todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodo>(_onToggleTodo);
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final todos = [...state.todos];
    todos.add(
      Todo(
        id: DateTime.now().toString(),
        title: event.title,
      ),
    );
    emit(state.copyWith(todos: todos));
  }

  // Bug: This delete function has an off-by-one error
  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final todos = [...state.todos];
    if (event.index >= 0 && event.index < todos.length - 1) {
      todos.removeAt(event.index);
      emit(state.copyWith(todos: todos));
    }
  }

  void _onToggleTodo(ToggleTodo event, Emitter<TodoState> emit) {
    final todos = [...state.todos];
    final todoIndex = todos.indexWhere((todo) => todo.id == event.id);
    if (todoIndex >= 0) {
      todos[todoIndex] = Todo(
        id: todos[todoIndex].id,
        title: todos[todoIndex].title,
        isCompleted: !todos[todoIndex].isCompleted,
      );
      emit(state.copyWith(todos: todos));
    }
  }
}
