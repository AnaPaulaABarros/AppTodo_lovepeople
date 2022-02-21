import 'package:apptodo_lovepeople/presenter/home_controller.dart';
import 'package:apptodo_lovepeople/view/todo/list_todo.dart';
import 'package:apptodo_lovepeople/view/user/register_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    context.read<HomeController>().tokenCheck().then((value) {
      if (value) {
        goHome(context);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: Consumer<HomeController>(builder: (context, controller, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
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
                                margin:
                                    const EdgeInsets.fromLTRB(60, 60, 60, 5),
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
                        Padding(
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
                                  hintText:
                                      ('Número de telefone, email ou CPF'),
                                  hintStyle:
                                      const TextStyle(color: Color(0xff3101B9)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
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
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              controller.login(
                                _emailController.text,
                                _passowrdController.text,
                                () {
                                  goHome(context);
                                },
                                () {
                                  const snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content:
                                        Text('Usuário ou senhas inválidos'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              );
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff3101B9)),
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
                      ],
                    ),
                  ),
                ),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const RegisterUserlogin()));
                    },
                  ),
                ],
              ),
            ],
          );
        }));
  }

  void goHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListTodoPage(),
      ),
    );
  }
}
