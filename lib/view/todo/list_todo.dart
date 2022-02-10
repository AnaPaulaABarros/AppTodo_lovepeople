import 'package:apptodo_lovepeople/model/login_user.dart';
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
          Container(
            padding: const EdgeInsets.all(10),
            alignment: AlignmentDirectional.topEnd,
            child: TextButton(
                onPressed: () {},
                child: const Text('SAIR',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ),
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
                        final todoNovo = controller.todos[index];
                        return _tarefas(
                            controller, todoNovo); // dando erro nesta parte
                      }),
                ),
                ElevatedButton(
                  style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => const RegisterTodos()))
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

Widget _tarefas(ListTodoPresenter controller, Todos todoNovo) {
  return Container(
    height: 120,
    width: 420,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: setColor(todoNovo.color),
      border: Border.all(width: 2, color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: () {},
      child: Row(children: [
        Column(
          children: [
            Text(
              todoNovo.title ?? "",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              todoNovo.description ?? "",
              style: const TextStyle(fontSize: 15, color: Color(0xFF3101B9)),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {}, //=> showDialog(
          //   context: context, //NÃO SEI PQ ESTÁ DANDO ESTE ERRO  NO CONTEXTO
          //   builder: (context) => AlertDialog(
          //       title: const Text('Deletar'),
          //       content: const Text('Deseja deletar este item?'),
          //       actions: <Widget>[
          //         TextButton(
          //           onPressed: () => Navigator.pop(context, 'Cancel'),
          //           child: const Text("Cancel"),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //            // controller.delete; NÃO CONSIGO CHAMAR O DELETE
          //             Navigator.of(context).pop();
          //           },
          //           child: const Text('OK'),
          //         ),
          //       ]),
          //),
          icon: const Icon(
            Icons.delete_sharp,
            color: Color(0xFF3101B9),
            size: 40,
          ),
        ),
      ]),
    ),
  );
}

Color setColor(String? color) {
  try {
    return Color(int.parse('0xFF${color?.replaceAll('#', '')}'));
  } catch (e) {
    return Colors.transparent;
  }
}
