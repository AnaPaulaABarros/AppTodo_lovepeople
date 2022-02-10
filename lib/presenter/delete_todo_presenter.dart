import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/delete_todo.dart';
import 'package:flutter/material.dart';

class DeletePresenter extends ChangeNotifier {
  final api = TodoApi();

  DeleteTodo delete = '' as DeleteTodo;

  Future<void> obterDelete() async {
    
    delete = api.deleteTodo as DeleteTodo;

    notifyListeners();
  }
}
