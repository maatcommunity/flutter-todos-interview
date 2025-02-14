import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_todos/features/todos/bloc/todo_bloc.dart';
import 'package:flutter_todos/features/todos/bloc/todo_event.dart';
import 'package:flutter_todos/features/todos/bloc/todo_state.dart';
import 'package:flutter_todos/features/todos/models/todo.dart';

// TODO: Testing Challenge
// 1. Implement test for loading todos
// 2. Implement test for adding a todo
// 3. Implement test for the delete bug
void main() {
  group('TodoBloc', () {
    late TodoBloc todoBloc;

    setUp(() {
      todoBloc = TodoBloc();
    });

    tearDown(() {
      todoBloc.close();
    });

    test('initial state is empty', () {
      expect(todoBloc.state.todos, isEmpty);
    });

    blocTest<TodoBloc, TodoState>(
      'Load todos test',
      build: () => todoBloc,
      act: (bloc) => (),
      expect: () => [],
    );
    blocTest<TodoBloc, TodoState>(
      'Add todo test',
      build: () => todoBloc,
      act: (bloc) => bloc.add(AddTodo('Test Todo')),
      expect: () => [],
    );

    blocTest<TodoBloc, TodoState>(
      'Delete todo test',
      build: () => todoBloc,
      seed: () => TodoState(todos: [
        Todo(id: '1', title: 'First Todo'),
        Todo(id: '2', title: 'Second Todo'),
      ]),
      act: (bloc) => bloc.add(DeleteTodo(0)),
      expect: () => [],
    );
  });
}
