import 'dart:ui';
import 'package:flutter/material.dart';

class RegisterTodo extends StatelessWidget {
  
   RegisterTodo({Key? key}) : super(key: key);

  
  final formkey = GlobalKey<FormState>();

  final _controler = TextEditingController();

  var value;

  get color => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Stack(
        children: [
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    Center(
                      child: Container(
                          alignment: AlignmentDirectional.topCenter,
                          child: const Text(
                            'Nova Tarefa',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          margin: const EdgeInsets.fromLTRB(40, 40, 40, 50)),
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color(0xff3101B9),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: ('Título tarefa'),
                        hintStyle: const TextStyle(
                          color: Color(0xFF3101B9),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFA901F7),
                                width: 5,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 50,
                          textAlign: TextAlign.left,
                          controller: _controler,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preenchimento obrigatorio!';
                            }
                          },
                          decoration: InputDecoration(
                            hintText:
                                ('Escreva uma descrição para sua tarefa.'),
                            hintStyle:  TextStyle(
                              color: const Color(0xFF3101B9).withOpacity(0.5),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: const Color(0xFFFFF2CC),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: const Color(0xFFFFD9F0),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: const Color(0xFFE8C5FF),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: const Color(0xFFCAFBFF),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: const Color(0xFFE3FFE6),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                              ),
                              onPressed: () {
                                if (formkey.currentState?.validate() == true) {
                                  Navigator.of(context).pop(_controler
                                      .text); // validação do button + retorno, falta fazer o text voltar
                                }
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 70,
                              )),
                          const SizedBox(
                            width: 80,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () {
                              if (formkey.currentState?.validate() == true) {
                                Navigator.of(context).pop(_controler
                                    .text); // validação do button + retorno, falta fazer o text voltar
                              }
                            },
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(2, 20, 15, 30),
            height: 110,
            width: 110,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(90),
                topRight: Radius.circular(3),
              ),
            ),
            child: Image.asset(
              'assets/images/logo_love.png',
              fit: BoxFit.contain,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
