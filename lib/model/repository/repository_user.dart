import 'dart:convert';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  final userKey = 'LoginKey';

  Future<void> salveLogin(LoginUser login) async {
    final resp = await SharedPreferences.getInstance();

    resp.setString(userKey, jsonEncode(login.toJson()));
  }

  Future<LoginUser?> getLogin() async {
    final resp = await SharedPreferences.getInstance();
    final cache = resp.getString(userKey);

    if (cache != null && cache.isNotEmpty) {
      return LoginUser.fromJson(jsonDecode(cache));
    }
    return null;
  }
}
