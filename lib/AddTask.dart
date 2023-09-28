import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String _title = '';
  String _description = '';

  void _hundleTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  void _hundleDescription(String description) {
    setState(() {
      _description = description;
    });
  }

  void _clickAddTask() {
    setState(() {
      var todo = Todo(title: _title, description: _description);
      Navigator.of(context).pop(todo);
    });
  }

  bool _disable() {
    return _title.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add Task'),
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Center(
          child: Column(
            children: [
              TextField(
                maxLines: 1,
                onChanged: _hundleTitle,
                decoration: const InputDecoration(
                    hintText: 'タイトルを入力(必須)'
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 3,
                onChanged: _hundleDescription,
                decoration: const InputDecoration(
                    hintText: '詳細を入力(任意)'
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _disable() ? null : _clickAddTask,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}