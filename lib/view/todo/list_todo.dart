import 'package:apptodo_lovepeople/model/list_todo.dart';
import 'package:apptodo_lovepeople/presenter/list_todo_presenter.dart';
import 'package:apptodo_lovepeople/view/todo/register_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTodoPage extends StatefulWidget {
  ListTodoPage({Key? key}) : super(key: key);

  @override
  State<ListTodoPage> createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  bool hidepassword = true;

  get adicionarRegistro => null;

  final _formkey = GlobalKey<FormState>();

  final _controler = TextEditingController();

  String filterText = '';

  @override
  void didChangeDependencies() {
    context.read<ListTodoPresenter>().obterListTodo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA901F7),
      body: Consumer<ListTodoPresenter>(builder: (context, controller, child) {
        return Stack(children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: const EdgeInsets.fromLTRB(40, 80, 20, 40),
                  child: const Text(
                    'Suas Listagens',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: TextField(
                    // onChanged: (text) {
                    // setState((){
                    // filterText = text;
                    //    });
                    // },
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
                      hintStyle: const TextStyle(
                          color: Color(0xff3101B9), fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              '${index + 1} - ${controller.todos[index].title}',
                            ),
                            onTap: () {},
                            trailing: IconButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: const Text('Deletar'),
                                    content:
                                        const Text('Deseja deletar este item?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ]),
                              ),
                              icon: const Icon(
                                Icons.delete_sharp,
                                color: Colors.white,
                                size: 40,
                              ),
                            ));
                      }),
                ),
                ElevatedButton(
                  style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => RegisterTodos()))
                        .then((value) {
                      if (value) {
                        controller.obterListTodo();
                      }
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ])),
          Container(
            padding: const EdgeInsets.fromLTRB(2, 15, 16, 30),
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
              height: 50,
              width: 50,
            ),
          ),
        ]);
      }),
    );
  }
}
