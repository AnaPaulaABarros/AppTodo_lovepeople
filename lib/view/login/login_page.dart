import 'package:apptodo_lovepeople/presenter/home_presenter.dart';
import 'package:apptodo_lovepeople/view/todo/list_todo.dart';
import 'package:apptodo_lovepeople/view/user/register_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();

  @override
  void didChangeDependencies() {
    context.read<HomePresenter>().obterLogin();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: Consumer<HomePresenter>(builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(60, 60, 60, 5),
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/images/logo_love.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Lovepeople',
                        style: (TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff3101B9),
                          fontWeight: FontWeight.w600,
                        )),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
                  child: const Text(
                    'Que bom que voltou!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains('@') ||
                                    value.trim().length == null) {
                                  return 'E-mail inválido';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: ('Número de telefone, email ou CPF'),
                                hintStyle:
                                    const TextStyle(color: Color(0xff3101B9)),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.trim().length == null) {
                                  return 'Senha inválida';
                                }
                              },
                              controller: _passowrdController,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye_sharp,
                                    color: const Color(0xff3101B9),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                                hintText: ('Senha'),
                                hintStyle:
                                    const TextStyle(color: Color(0xff3101B9)),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListTodo(),
                                  ),
                                );
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff3101B9)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            width: 1.5, color: Colors.white)))),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  height: 1.15),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Não possui cadastro?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              // ignore: deprecated_member_use
                              FlatButton(
                                child: Text(
                                  ' Clique aqui',
                                  style: TextStyle(
                                    color: Colors.yellow.shade900,
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              RegisterUserlogin()));
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        }));
  }
}
