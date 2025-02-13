import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todos/providers/todo_provider.dart';

void main() {
  testWidgets('Add todo test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TodoProvider(),
        child: const MyApp(),
      ),
    );

    // Enter text in the TextField
    await tester.enterText(find.byType(TextField), 'Test Todo');
    
    // Tap the add button
    await tester.tap(find.text('Add'));
    await tester.pump();

    // Verify that the todo was added
    expect(find.text('Test Todo'), findsOneWidget);
  });

  // TODO: Candidate Task - Write a test for the delete functionality
  // The test should verify that todos are properly removed from the list
}
