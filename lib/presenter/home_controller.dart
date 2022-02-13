import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  final api = TodoApi();

  LoginUser? logins;

  void login(
      String email, String senha, VoidCallback sucesso, VoidCallback falha) {
    api.login(email, senha).then((value) async {
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
