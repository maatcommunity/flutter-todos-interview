import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/todo.dart';

// Events
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final String title;

  const AddTodo(this.title);

  @override
  List<Object> get props => [title];
}

class DeleteTodo extends TodoEvent {
  final int index;

  const DeleteTodo(this.index);

  @override
  List<Object> get props => [index];
}

class ToggleTodo extends TodoEvent {
  final String id;

  const ToggleTodo(this.id);

  @override
  List<Object> get props => [id];
}

// State
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

// Bloc
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
