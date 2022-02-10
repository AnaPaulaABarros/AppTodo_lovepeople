import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/delete_todo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeletePresenter extends ChangeNotifier {
  final api = TodoApi();

  //final deletar = '';

  // void deleteTodo( //NÃO APARECE COMO FUNÇÃO
  //     int idTodo, VoidCallback sucesso, VoidCallback falha) {
  //   api.deletar(idTodo).then((value) async {
  //     final p = await SharedPreferences.getInstance();
  //     p.setString('jwt', value!);
  //     sucesso();
  //   }).onError((Object? erro, _) {
  //     falha();
  //   });
  // }
}
