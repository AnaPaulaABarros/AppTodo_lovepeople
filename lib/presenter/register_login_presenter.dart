

import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:flutter/material.dart';

class RegisterLoginPresenter extends ChangeNotifier {
  final api = TodoApi();

   LoginUser? registro;

   obterRegistro() async {

    
     registro = await api.registers('email','nome','senha');

    notifyListeners();
  }
}