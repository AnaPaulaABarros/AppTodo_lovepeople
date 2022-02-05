// ignore_for_file: deprecated_member_use

import 'package:apptodo_lovepeople/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: ListView(padding: const EdgeInsets.all(20), children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Vamos começar!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 80,
          ),
          Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                      controller: _nomeController,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().length == null) {
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
                            borderSide: const BorderSide(color: Colors.white)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
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
                        hintStyle: const TextStyle(
                            color: Color(0xff3101B9), fontSize: 20),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.white)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: _senhaController,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().length == null) {
                          return 'Senha inválida';
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
                            borderSide: const BorderSide(color: Colors.white)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: _checkController,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().length == null) {
                          return 'Senha inválida';
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
                            borderSide: const BorderSide(color: Colors.white)),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff3101B9)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                                width: 2, color: Colors.white)))),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, height: 1.0),
                    ),
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Já possui cadastro?',
                        style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w400),
                      ),
                      
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Home()));
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                                  color: Colors.yellow.shade900,
                                  fontSize: 18,),
                          )),
                    ],
                  ),
                ],
              )),
        ]));
  }
}

//alreadyRegistered(context) {
 // Navigator.of(context).push(
    //  MaterialPageRoute(
      //  builder: (context) => const Home(),
    //  ),
  //  );
 // }

