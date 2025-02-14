import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_todos/blocs/todo_bloc.dart';

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
      'emits new state with added todo',
      build: () => todoBloc,
      act: (bloc) => bloc.add(const AddTodo('Test Todo')),
      expect: () => [
        isA<TodoState>().having(
          (state) => state.todos.first.title,
          'todo title',
          equals('Test Todo'),
        ),
      ],
    );

    // TODO: Candidate Task - Write a test for the toggle todo functionality
    // The test should verify that a todo's completion status changes when toggled

    // TODO: Candidate Task - Write a test that reveals the bug in delete functionality
    // The test should show that the last todo cannot be deleted
  });
}
