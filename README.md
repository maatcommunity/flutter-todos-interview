# Flutter Todo App - Technical Interview Assessment

This Flutter application is designed to evaluate technical skills across various aspects of Flutter development, state management, and software engineering principles.

## Getting Started

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter test` to execute the test suite
4. Run `flutter run` to start the application

## Interview Objectives

The candidate should work through the following tasks, implementing solutions and explaining their thought process:

### 1. Core BLoC Testing
- Implement missing test cases in `test/blocs/todo_bloc_test.dart`
- Focus on testing state transitions and edge cases
- Demonstrate understanding of the BLoC pattern and testing best practices

### 2. Critical Bug Hunt
- Identify and fix the off-by-one error in the delete functionality
- Add test coverage for the fix
- Consider edge cases and error handling

### 3. Architecture Challenge
- Enhance the `TodoStorageService` to handle persistence
- Implement proper error handling for storage operations
- Integrate storage with BLoC lifecycle (loading initial state, saving changes)

### 4. State Optimization
- Analyze the current widget tree for unnecessary rebuilds
- Optimize BlocBuilder usage
- Implement selective rebuilding where appropriate

### 5. Error Handling
Implement proper error handling for:
- Invalid indices in list operations
- Empty or invalid inputs
- Storage/persistence failures
- Edge cases in state transitions

### 6. Code Quality Review
The candidate should identify and improve:
- Code organization and structure
- State and event class design
- Error handling patterns
- Widget composition
- Test coverage

## Project Structure

```
lib/
├── features/
│   └── todos/
│       ├── bloc/
│       ├── models/
│       ├── services/
│       └── view/
├── screens/
└── main.dart
```

## Evaluation Criteria

The candidate will be evaluated on:
1. Code quality and organization
2. Testing approach and coverage
3. Problem-solving skills
4. Understanding of Flutter and BLoC patterns
5. Error handling and edge cases
6. Performance considerations
7. Communication and explanation of decisions

## Notes for the Interviewer

- The codebase contains intentional issues for the candidate to identify and fix
- TODOs are placed throughout the code to guide the assessment
- Pay attention to how candidates approach problems and explain their solutions
- Consider both the technical implementation and the reasoning behind decisions
