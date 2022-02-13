import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:apptodo_lovepeople/model/repository/repository_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/register_user.dart';

class RegisterLoginController extends ChangeNotifier {
  final api = TodoApi();

  RegisterUser? cadastros;

  void cadastro(String email, String senha, String nome, VoidCallback sucesso,
      VoidCallback falha) {
    api.registersUser(email, senha, nome).then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('jwt', value!.jwt!);
      sucesso();
    }).onError((erro, _) {
      falha();
    });
  }

  Future<bool> tokenCheck() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('jwt') != null) {
      return true;
    } else {
      return false;
    }
  }
}
