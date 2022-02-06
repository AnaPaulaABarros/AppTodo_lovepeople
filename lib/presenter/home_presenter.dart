import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:flutter/foundation.dart';

class HomePresenter extends ChangeNotifier {
  final api = TodoApi();

  LoginUser? logins;

  void obterLogin() async {
    // logins = api.login as LoginUser;

    notifyListeners();
  }
}
