import 'dart:convert';
import 'package:apptodo_lovepeople/model/Delete_Todo.dart';
import 'package:apptodo_lovepeople/model/List_Todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:apptodo_lovepeople/model/register_Todo.dart';
import 'package:apptodo_lovepeople/model/register_user.dart';
import 'package:http/http.dart' as http;

class TodoApi {
  
  String token = '';

  bool isLoading = false;

  get deleteTodo => null;

  Future login(String email, String senha) async {
    var url = Uri.parse('https:todo-lovepeople.herokuapp.com/auth/local');
    var response = await http.post(
      url,
      body: {
        'identifier': email,
        'password': senha,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      LoginUser resp = LoginUser.fromJson(json);
      token = resp.jwt!;
    }
  }

  Future registers(String email, String nome, String senha) async {
    var url =
        Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local/register');
    var response = await http.post(url, body: {
      'username': nome,
      'email': email,
      'password': senha,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      RegisterUser resp = RegisterUser.fromJson(json);
      token = resp.jwt!;
    }
  }

  Future listTodo() async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      ListTodo resp = ListTodo.fromJson(json);
    }
  }

  Future registersTodo(String titulo, String descricao, String cor) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      RegisterTodo resp = RegisterTodo.fromJson(json);
    }

    void deleteTodo(String titulo, String descricao, String cor) async {
      var url =
          Uri.parse('https://todo-lovepeople.herokuapp.com/todos/{idTodo}');

      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        DeleteTodo resp = DeleteTodo.fromJson(json);
      }
    }
  }
}
