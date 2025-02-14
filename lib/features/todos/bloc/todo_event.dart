import 'package:equatable/equatable.dart';

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
