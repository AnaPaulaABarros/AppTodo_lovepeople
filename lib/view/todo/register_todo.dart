import 'package:apptodo_lovepeople/presenter/register_todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterTodos extends StatefulWidget {
  const RegisterTodos({Key? key, String? title, description, color})
      : super(key: key);

  @override
  State<RegisterTodos> createState() => _RegisterTodoState();
}

class _RegisterTodoState extends State<RegisterTodos> {
  final _formkey = GlobalKey<FormState>();
  final _controlerAssignment = TextEditingController();
  final _controlerTitle = TextEditingController();

  late String _cor = '';
  final _cores = ['FFF2CC', 'FFD9F0', 'E8C5FF', 'CAFBFF', 'E3FFE6'];

  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Consumer<RegisterTodoController>(
        builder: (context, controller, child) {
          return Stack(
            children: [
              Form(
                key: _formkey,
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
                              margin:
                                  const EdgeInsets.fromLTRB(40, 40, 40, 50)),
                        ),
                        TextFormField(
                          controller: _controlerTitle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preenchimento obrigatorio!';
                            }
                          },
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
                              controller: _controlerAssignment,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Preenchimento obrigatorio!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    ('Escreva uma descrição para sua tarefa.'),
                                hintStyle: TextStyle(
                                  color:
                                      const Color(0xFF3101B9).withOpacity(0.5),
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
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: mapaDeCores(),
                          margin: const EdgeInsets.only(
                              top: 10, left: 40, right: 40),
                          height: 40,
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
                                    (Navigator.of(context).pop(value));
                                    if (_formkey.currentState!.validate()) {}
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
                                    String title = _controlerTitle.text;
                                    String assignment =
                                        _controlerAssignment.text;
                                    if (title.isNotEmpty &&
                                        assignment.isNotEmpty) {
                                      controller.registrarTodo(
                                        title,
                                        assignment,
                                        _cor,
                                        () {
                                          Navigator.of(context).pop(true);
                                        },
                                        () {
                                          const snackBar = SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                'Sua tarefa não foi cadastrada'),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                      );
                                    }
                                  },
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 70,
                                  ))
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
          );
        },
      ),
    );
  }

  ListView mapaDeCores() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _cores.length,
      itemBuilder: (context, index) {
        final colorButton = '0xFF${_cores[index]}';
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: Color(
              int.parse(colorButton),
            ),
            elevation: _cor == _cores[index] ? 10 : 0,
          ),
          onPressed: () {
            setState(() {
              _cor = _cores[index];
            });
          },
          child: const SizedBox(
            width: 20,
          ),
        );
      },
    );
  }
}
