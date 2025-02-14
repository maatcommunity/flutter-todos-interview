import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/features/todos/bloc/todo_bloc.dart';
import 'package:flutter_todos/features/todos/bloc/todo_event.dart';
import 'package:flutter_todos/features/todos/view/add_todo_widget.dart';

// TODO: UI Optimization Challenge
// 1. Analyze widget rebuild patterns
// 2. Consider breaking down into smaller widgets
// 3. Implement selective rebuilding
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const AddTodoWidget(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'Buy groceries',
                    style: TextStyle(
                      decoration: null,
                    ),
                  ),
                  leading: Checkbox(
                    value: false,
                    onChanged: (_) =>
                        context.read<TodoBloc>().add(DeleteTodo(0)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        context.read<TodoBloc>().add(DeleteTodo(0)),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Do laundry',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  leading: Checkbox(
                    value: true,
                    onChanged: (_) =>
                        context.read<TodoBloc>().add(DeleteTodo(1)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        context.read<TodoBloc>().add(DeleteTodo(1)),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Walk the dog',
                    style: TextStyle(
                      decoration: null,
                    ),
                  ),
                  leading: Checkbox(
                    value: false,
                    onChanged: (_) =>
                        context.read<TodoBloc>().add(DeleteTodo(2)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        context.read<TodoBloc>().add(DeleteTodo(2)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
