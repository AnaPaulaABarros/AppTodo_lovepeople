import 'package:apptodo_lovepeople/model/register_Todo.dart';
import 'package:apptodo_lovepeople/view/todo/list_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationCompleted extends StatelessWidget {
  
  const RegistrationCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(
                      40,
                      0,
                      40,
                      20,
                    ),
                    child: const Text(
                      'Cadastro concluído!',
                      style: 
                       TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListTodo()));
                    },
                    
                    child: const Text(
                      'Começar',
                      style:   TextStyle(
                            fontSize: 20,
                            height: 1.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                  ),
                    
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff3101B9),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side:
                              const BorderSide(width: 1.5, color: Colors.white),
                        ),
                      ),
                    ),
                  
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(195),
                topRight: Radius.circular(195),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                        width: 220,
                        height: 180,
                        child: Image.asset(
                          'assets/images/ada_voando.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Os ventos da programação estão indo até você',
                        style: TextStyle(
                            fontSize: 15.8,
                            color: Color(0xff3101B9),
                            fontWeight: FontWeight.w400,
                            // height: 16.5,
                         
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
