import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ListTodo extends StatelessWidget {
  
   ListTodo({Key? key}) : super(key: key);

  
  bool hidepassword = true;
  get adicionarRegistro => null;
List<String> registro = ['Ana Paula','arroz'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffA901F7),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.fromLTRB(20, 45, 20, 40),
                child: const Text(
                  'Suas Listagens',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: ('Busque a palavra chave'),
                    suffixIcon: const SizedBox(
                      child: Icon(
                        Icons.search,
                        color: Color(0xff3101B9),
                      ),
                    ),
                    hintStyle:
                        const TextStyle(color: Color(0xff3101B9), fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: registro.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '${index + 1} - ${registro[index]}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xffffffff),
                          ),
                        ),
                        trailing: Icon(Icons.delete),
                        //icon button
                      );

                    }),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: ElevatedButton(
                  onPressed: () {
                    final resultado = Navigator.of(context)
                        .pushNamed('/novatarefa')
                        .then((value) {
                      if (value != null) {
                      //setState(() {
                        // registro.add(value.toString());
                        //});
                      }
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ),
            ])));
  }
}

  




  
