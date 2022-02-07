import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:apptodo_lovepeople/model/repository/repository_user.dart';
import 'package:flutter/material.dart';

class RegisterLoginPresenter extends ChangeNotifier {
  
  late UserPreferences repository;

  final api = TodoApi();

  bool loading = false;


   LoginUser? registro;

  void obterRegistro() async {
    
    registro = await api.registers('email', 'nome', 'senha');

    notifyListeners();
  }
}
