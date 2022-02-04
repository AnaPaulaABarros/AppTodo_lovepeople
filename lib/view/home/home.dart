import 'package:apptodo_lovepeople/model/register_user.dart';
import 'package:apptodo_lovepeople/view/todo/register_todo.dart';
import 'package:apptodo_lovepeople/view/user/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isObscure = true;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: SingleChildScrollView(
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
                            decoration: InputDecoration(
                          hintText: ('Número de telefone, email ou CPF'),
                          hintStyle: const TextStyle(color: Color(0xff3101B9)),
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
                              if (value!.isEmpty) {
                                return 'Preenchimento obrigatorio!';
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
                            final resultado = Navigator.of(context)
                                .push( MaterialPageRoute(
                                    builder: (context) =>  RegisterTodo()))
                                .then((value) {
                              if (_formkey.currentState!.validate()) {
                                //bool loginCerto = await RegisterUser(jwt: ID);
                                setState(() {});
                              }
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff3101B9)),
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
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            InkWell(
                                child: Text(
                                  ' Clique aqui',
                                  style: TextStyle(
                                    color: Colors.yellow[900],
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                onTap: () {
                                  _newRegister(context);
                                }),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  void _newRegister(context) {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegisterTodo()))
        .then((value) {
      if (_formkey.currentState!.validate()) {
        setState() {}
      }
    });
  }
}
