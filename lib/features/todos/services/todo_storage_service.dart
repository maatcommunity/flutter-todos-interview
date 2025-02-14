import 'dart:convert';
import 'package:shared_preferences.dart';
import 'package:flutter_todos/features/todos/models/todo.dart';

class TodoStorageService {
  static const String _key = 'todos';

  Future<List<Todo>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosJson = prefs.getString(_key);
    if (todosJson == null) return [];

    final List<dynamic> jsonList = json.decode(todosJson);
    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final String todosJson = json.encode(
      todos.map((todo) => todo.toJson()).toList(),
    );
    await prefs.setString(_key, todosJson);
  }
}
