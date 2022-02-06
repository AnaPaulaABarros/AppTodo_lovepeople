import 'package:apptodo_lovepeople/model/Api/api_todo.dart';
import 'package:apptodo_lovepeople/presenter/home_presenter.dart';
import 'package:apptodo_lovepeople/presenter/list_todo_presenter.dart';
import 'package:apptodo_lovepeople/presenter/register_todo_presenter.dart';
import 'package:apptodo_lovepeople/view/login/login_page.dart';
import 'package:apptodo_lovepeople/view/todo/list_todo.dart';
import 'package:apptodo_lovepeople/view/todo/register_todo.dart';
import 'package:apptodo_lovepeople/view/user/registration_completed_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'view/user/register_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePresenter()),
        ChangeNotifierProvider(create: (_) => ListTodoPresenter()),
        ChangeNotifierProvider(create: (_) => RegisterTodoPresenter()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color(0xFFA901F7),
            primaryVariant: Color(0xFFA901F7),
            secondary: Color(0xFFA901F7),
            secondaryVariant: Color(0xFFA901F7),
            surface: Color(0xFFA901F7),
            background: Color(0xFFA901F7),
            error: Color(0xFFA901F7),
            onPrimary: Color(0xFFA901F7),
            onSecondary: Color(0xFFA901F7),
            onSurface: Color(0xFFA901F7),
            onBackground: Color(0xFFA901F7),
            onError: Color(0xFFA901F7),
            brightness: Brightness.light,
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}
