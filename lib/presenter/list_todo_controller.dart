import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/list_todo.dart';
import 'package:flutter/material.dart';

class ListTodoController extends ChangeNotifier {
  final api = TodoApi();

  List<ListTodo> todos = [];
  List<ListTodo> _originalTodos = [];

  void obterListTodo() {
    api.listTodo().then((value) {
      todos = value;
      notifyListeners();
    }).onError((erro, _) {});
  }

  final api2 = DeleteItemRepository();

  late DeleteItemRepository delete;

  void deleteItem(ListTodo tasklist) {
    delete.deleteItem(tasklist.id).then((response) {
      if (response != null) {
        todos.remove(tasklist);
        notifyListeners();
      }
    });
  }

  void filter(String filters) {
    todos = _originalTodos
        .where((element) =>
            element.title!.toLowerCase().contains(filters.toLowerCase()) ||
            element.description!.toLowerCase().contains(filters.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
