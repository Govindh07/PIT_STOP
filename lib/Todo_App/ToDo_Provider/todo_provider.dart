import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> _todos = [
    'Buy groceries',
    'Attend meeting at 10 AM',
    'Walk the dog',
    'Read a book',
    'Pay electricity bill',
  ];

  List<String> get todos => _todos;

  void addTodo(String task) {
    _todos.add(task);
    notifyListeners();
  }

  void removeTodo(String task) {
    _todos.remove(task);
    notifyListeners();
  }
}
