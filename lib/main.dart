import 'package:apptodo_lovepeople/presenter/home_controller.dart';
import 'package:apptodo_lovepeople/presenter/list_todo_controller.dart';
import 'package:apptodo_lovepeople/presenter/register_login_controller.dart';
import 'package:apptodo_lovepeople/presenter/register_todo_controller.dart';
import 'package:apptodo_lovepeople/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => ListTodoController()),
        ChangeNotifierProvider(create: (_) => RegisterTodoController()),
        ChangeNotifierProvider(create: (_) => RegisterLoginController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color(0xFFA901F7),
            secondary: Color(0xFFA901F7),
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
        home: const LoginPage(),
      ),
    );
  }
}
