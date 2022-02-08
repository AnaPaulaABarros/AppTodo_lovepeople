import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/list_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTodoPresenter extends ChangeNotifier {
  final api = TodoApi();

  List<ListTodo> todos = [];

  void obterListTodo() {
    api.listTodo().then((value) {
      todos = value;
      notifyListeners();
    }).onError((erro, _) {});
  }
}
