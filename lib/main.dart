import 'package:flutter/material.dart';
import 'package:todo_app/AddTask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Todo {
  String title;
  String description;

  Todo({required this.title, required this.description});
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> list = [];

  void _navigateAddTask() async {
    final newTodo = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return const AddTaskPage();
      }),
    );
    if (newTodo != null) {
      setState(() {
        list.add(newTodo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ListView.builder(
            itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Text(list[index].title,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(list[index].description,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          )
          // child: ListView(
          //   children: [
          //     const SizedBox(height: 8),
          //
          //     const SizedBox(height: 8),
          //   ],
          // ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAddTask,
        tooltip: 'add task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
