import 'package:apptodo_lovepeople/model/list_todo.dart';
import 'package:apptodo_lovepeople/presenter/list_todo_controller.dart';
import 'package:apptodo_lovepeople/view/login/login_page.dart';
import 'package:apptodo_lovepeople/view/todo/register_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListTodoPage extends StatefulWidget {
  ListTodoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTodoPage> createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  bool hidepassword = true;

  get adicionarRegistro => null;

  final _formkey = GlobalKey<FormState>();

  final _controler = TextEditingController();

  String filterText = '';

  late ListTodo tasksNew;

  @override
  void didChangeDependencies() {
    context.read<ListTodoController>().obterListTodo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA901F7),
      body: Consumer<ListTodoController>(builder: (context, controller, child) {
        return Stack(children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: AlignmentDirectional.topEnd,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                bool jwt = await sharedPreferences.remove('jwt');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
            ),
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
                    onChanged: (filters) {
                      controller.filter(filters);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: ('Busque a palavra chave'),
                      suffixIcon: const SizedBox(
                        child: Icon(
                          Icons.search,
                          color: Color(0xff3101B9),
                          size: 30,
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
                        final todo = controller.todos[index];
                        return tasks(controller, todo,
                            context); // dando erro nesta parte
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

Widget tasks(
    ListTodoController controller, ListTodo tasksList, BuildContext context) {
  return Container(
    height: 120,
    width: 500,
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: setColor(tasksList.color),
      border: Border.all(width: 2, color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
      Container(
        alignment: Alignment.topLeft,
        height: 120,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tasksList.title ?? "",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF3101B9)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              tasksList.description ?? "",
              style: const TextStyle(fontSize: 15, color: Color(0xFF3101B9)),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.topRight,
        height: 120,
        width: 50,
        child: IconButton(
          padding: const EdgeInsets.only(bottom: 70),
          alignment: Alignment.centerRight,
          icon: const Icon(
            Icons.delete_sharp,
            color: Color.fromARGB(255, 51, 30, 109),
            size: 50,
          ),
          onPressed: () {
            deleteList(controller, tasksList, context);
          },
        ),
      ),
    ]),
  );
}

Color setColor(String? color) {
  try {
    return Color(int.parse('0xFF${color?.replaceAll('#', '')}'));
  } catch (e) {
    return Colors.transparent;
  }
}

void deleteList(
    ListTodoController controller, ListTodo tasksList, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Deseja deletar este item?",
            style: TextStyle(
              color: Color(0xFF3101B9),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: Text(
            " ${tasksList.title!} será movido para lixeira.",
            style: const TextStyle(
              color: Color(0xFF3101B9),
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.deleteItem(tasksList);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Confirmar",
                style: TextStyle(
                  color: Color(0xFF3101B9),
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancelar",
                style: TextStyle(
                  color: Color(0xFFA901F7),
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        );
      });
}
