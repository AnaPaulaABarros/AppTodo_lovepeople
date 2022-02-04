import 'package:apptodo_lovepeople/view/home/home.dart';
import 'package:flutter/material.dart';

class RegisterUserlogin extends StatefulWidget {
  const RegisterUserlogin({Key? key}) : super(key: key);

  @override
  State<RegisterUserlogin> createState() => _RegisterUserloginState();
}

class _RegisterUserloginState extends State<RegisterUserlogin> {
  bool _isObscure = true;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  final _checkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Vamos começar!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formkey,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          TextFormField(
                              controller: _nomeController,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().length == null) {
                                  return 'Item obrigatório!';
                                }
                                ;
                              },
                              decoration: InputDecoration(
                                hintText: ('Nome'),
                                hintStyle: const TextStyle(
                                    color: Color(0xff3101B9), fontSize: 20),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().length == null) {
                                  return 'Item obrigatório!';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: ('Número de telefone, email ou CPF'),
                                hintStyle: const TextStyle(
                                    color: Color(0xff3101B9), fontSize: 20),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: _senhaController,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().length == null) {
                                  return 'Item obrigatório!';
                                }
                              },
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
                                hintStyle: const TextStyle(
                                    color: Color(0xff3101B9), fontSize: 20),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: _checkController,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().length == null) {
                                  return 'Item obrigatório!';
                                }
                              },
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
                                hintText: ('Confirmar senha'),
                                hintStyle: const TextStyle(
                                    color: Color(0xff3101B9), fontSize: 20),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff3101B9)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: const BorderSide(
                                            width: 2, color: Colors.white)))),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  height: 1.0),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Já possui cadastro?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              InkWell(
                                  onTap: _alreadyRegistered(context),
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 16),
                                  )),
                            ],
                          ),
                        ],
                      ))),
            ]));
  }
}

_alreadyRegistered(context) {
  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

