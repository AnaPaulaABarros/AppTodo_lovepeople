import 'package:apptodo_lovepeople/model/register_Todo.dart';
import 'package:apptodo_lovepeople/view/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class RegistrationCompleted extends State<Home> {
 
  List<String> list = [];

  var index;

  void addList(value) {
    list.add(value);
  }
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: Column(children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(40, 200, 40, 20),
                child: Text(
                  'Cadastro concluído!',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onLongPress: (){},
              //  onPressed: () {
               //   final resultado = Navigator.of(context)
                //      .push(new MaterialPageRoute(
                 //         builder: (context) =>  RegisterTodo()))
                 //     .then((value) {
                 //   if (value != null) {
               //       setState(() {
                 //       addList(value);
                 //     });
                   // }
                 // });
               // },
                child: Text('Começar',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          height: 1.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff3101B9),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                            width: 1.5, color: Colors.white)))), onPressed: () {  },
              ),
              const SizedBox(
                height: 182,
              ),
              Column(
                children: [
                  Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(195),
                            topRight: Radius.circular(195)),
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
                                const SizedBox(height: 20,),
                                Text(
                                 'Os ventos da programação estão indo até você',
                                 style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      fontSize: 15.8,
                                      color: Color(0xff3101B9),
                                      fontWeight: FontWeight.w400,
                                     // height: 16.5,
                                    ),
                                ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          )
        ]));
  }
}


