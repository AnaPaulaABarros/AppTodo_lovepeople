import 'package:apptodo_lovepeople/presenter/list_todo_presenter.dart';
import 'package:apptodo_lovepeople/view/todo/register_todo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTodo extends StatelessWidget {
  ListTodo({Key? key}) : super(key: key);

  bool hidepassword = true;

  get adicionarRegistro => null;

  List<String> list = [];

  final _formkey = GlobalKey<FormState>();

  final _controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA901F7),
      body: Consumer<ListTodoPresenter>(
        builder: (context, value, child) {
        if (value.todos.isEmpty)
              return const Center(child: CircularProgressIndicator());
         return Stack(children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: const EdgeInsets.fromLTRB(20, 45, 20, 40),
                  child: const Text(
                    'Suas Listagens',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
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
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              '${index + 1} - ${list[index]}',
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterTodo(),
                                ),
                              );
                            });
                        trailing:
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_sharp,
                              color: Colors.white,
                              size: 40,
                            ));
                      }),
                ),
                ElevatedButton(
                    style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new RegisterTodo()))
                          .then((value) {
                        if (_formkey.currentState!.validate()) {
                          setState() {
                            addList(value);
                          }
                        }
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 70,
                    )),
              ])),
          Container(
            padding: const EdgeInsets.fromLTRB(2, 15, 16, 30),
            height: 100,
            width: 100,
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
              height: 50,
              width: 50,
            ),
          ),
        ]);
        }),
    );
  }

  void addList(value) {
    list.add(value);
  }
}
