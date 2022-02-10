import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/register_Todo.dart';
import 'package:flutter/material.dart';

class RegisterTodoPresenter extends ChangeNotifier {
  final api = TodoApi();

  void registrarTodo(String titulo, String descricao, String cor,
      VoidCallback sucesso, VoidCallback falha) async {
    api.registersTodo(titulo, descricao, cor).then((value) {
      sucesso();
    }).onError((Object? erro, _) {
      falha();
    });
  }
}
