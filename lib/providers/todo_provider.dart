import 'package:flutter/foundation.dart';
import 'package:flutter_todos/models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(
      Todo(
        id: DateTime.now().toString(),
        title: title,
      ),
    );
    notifyListeners();
  }

  // Bug: This delete function has an off-by-one error
  void deleteTodo(int index) {
    if (index >= 0 && index < _todos.length - 1) {
      _todos.removeAt(index);
      notifyListeners();
    }
  }

  void toggleTodo(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
      notifyListeners();
    }
  }
}
