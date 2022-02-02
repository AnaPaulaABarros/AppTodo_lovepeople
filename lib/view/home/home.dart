import 'dart:ui';
import 'package:apptodo_lovepeople/model/register_user.dart';
import 'package:apptodo_lovepeople/view/todo/register_todo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget  {

  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isObscure = true;

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
                    style: (
                       TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff3101B9),
                        fontWeight: FontWeight.w600,
                        // height: 16.5,
                      )
                    ),
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
              child: TextFormField(
                  decoration: InputDecoration(
                hintText: ('Número de telefone, email ou CPF'),
                hintStyle: const TextStyle(color: Color(0xff3101B9)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white)),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
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
                    hintStyle: const TextStyle(color: Color(0xff3101B9)),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white)),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton( onPressed: (){},
              //onPressed: () {
                //  final resultado = Navigator.of(context)
                  //    .push(new MaterialPageRoute(
                  //        builder: (context) => new RegisterUser()))
                  //    .then((value) {
                  //  if (value != null) {
                  //    setState(() {
                        
                   //   });
                  //  }
                //  });
               // },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff3101B9)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2, color: Colors.white)))),
              child: const Text(
                'Entrar',
                style:
                    TextStyle(color: Colors.white, fontSize: 22, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
              child: const Text(
                'Não possui cadastro? Clique aqui',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
