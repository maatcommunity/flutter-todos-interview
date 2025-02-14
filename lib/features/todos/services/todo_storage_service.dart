import 'dart:convert';
import 'package:flutter_todos/features/todos/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Persistence Service Challenge
// 1. Implemente adding a todo
// 2. Implemente removing a todo
// 3. Improve loading todos from shared preferences
class TodoStorageService {
  static const String _key = 'todos';

  Future<List<Todo>> loadTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? todosJson = prefs.getString(_key);
      if (todosJson == null) return [];

      final List<dynamic> jsonList = json.decode(todosJson);
      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTodo(Todo todo) async {
    throw UnimplementedError();
  }

  Future<void> removeTodo(String id) async {
    throw UnimplementedError();
  }
}
