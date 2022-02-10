import 'dart:convert';
import 'package:apptodo_lovepeople/model/delete_todo.dart';
import 'package:apptodo_lovepeople/model/list_todo.dart';
import 'package:apptodo_lovepeople/model/login_user.dart';
import 'package:apptodo_lovepeople/model/register_Todo.dart';
import 'package:apptodo_lovepeople/model/register_user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TodoApi {
  String token = '';

  bool isLoading = false;

  Future<LoginUser?> login(String email, String senha) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local');
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
      return resp;
    }
  }

  Future<RegisterUser?> registersUser(
      String email, String nome, String senha) async {
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
      return resp;
    }
  }

  Future<List<ListTodo>> listTodo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $jwt",
      },
    );
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);

      return json.map<ListTodo>((value) {
        return ListTodo.fromJson(value);
      }).toList();
    } else {
      return [];
    }
  }

  Future registersTodo(String titulo, String descricao, String cor) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.post(url, headers: {
      "Authorization": "Bearer $jwt",
    }, body: {
      "title": titulo,
      "description": descricao,
      "color": cor,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      RegisterTodo resp = RegisterTodo.fromJson(json);
    }

    Future<DeleteTodo?> deletar(int idTodo) async {
      //NÃO APARECE COMO MÉTODO NA PRESENTER
      return http
          .delete(
        Uri.parse('https://todo-lovepeople.herokuapp.com/todos/${idTodo}'),
      )
          .then((value) async {
        if (response.statusCode == 200) {
          Map<String, dynamic> json = jsonDecode(response.body);
          DeleteTodo resp = DeleteTodo.fromJson(json);
        }
      });
    }
  }
}
