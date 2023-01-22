import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data/TasksData.dart';

class TodosNotifier extends ChangeNotifier {
  List<Todo> todos = <Todo>[];

  // Let's allow the UI to add todos.
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  // Let's allow removing todos
  void removeTodo(int todoId) {
    todos.remove(todos.firstWhere((element) => element.id == todoId));
    notifyListeners();
  }

  // Let's mark a todo as completed
  Todo toggle(int todoId) {
    for (final todo in todos) {
      if (todo.id == todoId) {
        todo.checked == "false" ? todo.checked = "true" : todo.checked = "false";
        return todo;
        notifyListeners();
      }
    }
    return todos.first;
  }
}
final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});