import 'package:flutter/material.dart';
import 'package:mintic_un_todo_core/mintic_un_todo_core.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  late TextEditingController _controller;
  List<ToDo> todos = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    ToDoService.initialize().then(
      (_) => ToDoService.getAll().then(
        (value) {
          setState(() {
            todos = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tareas"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Nueva tarea"),
                )),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      final toDo = ToDo(content: _controller.text);
                      ToDoService.save(toDo: toDo).then((_) {
                        setState(() {
                          _controller.clear();
                          todos.add(toDo);
                        });
                      });
                    },
                    child: const Text("Aceptar"))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final toDo = todos[index];
                    return ListTile(
                      leading: AbsorbPointer(
                        absorbing: toDo.completed,
                        child: IconButton(
                          icon: Icon(
                            toDo.completed
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: toDo.completed ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            toDo.completed = true;
                            ToDoService.update(toDo: toDo).then((_) {
                              setState(() {
                                todos[index] = toDo;
                              });
                            });
                          },
                        ),
                      ),
                      title: Text(toDo.content),
                      trailing: IconButton(
                          onPressed: () {
                            ToDoService.delete(toDo: toDo).then((_) {
                              setState(() {
                                todos.removeAt(index);
                              });
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    );
                  }))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          ToDoService.deleteAll().then((_) {
            setState(() {
              todos.clear();
            });
          });
        },
      ),
    );
  }
}
