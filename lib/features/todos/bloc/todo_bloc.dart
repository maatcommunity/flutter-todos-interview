import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/features/todos/bloc/todo_event.dart';
import 'package:flutter_todos/features/todos/bloc/todo_state.dart';

// TODO: Bloc Implementation Challenge
// 1. Implement loading todos from storage
// 2. Implement saving todos to storage
// 3. Implement deleting todos from storage
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {}

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {}
}
