import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/register_Todo.dart';
import 'package:flutter/material.dart';

class RegisterTodoPresenter extends ChangeNotifier {
  
  final api = TodoApi();

  RegisterTodo? registro;

  void obterTodo() async {
    
    registro = await api.registersTodo('titulo', 'descricao', 'cor');

    notifyListeners();
  }
  
}
