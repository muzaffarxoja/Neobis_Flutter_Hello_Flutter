import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() {
    return _TaskState();
  }
}

class _TaskState extends State<Task> {
  List<String> taskList = [];

  final TextEditingController taskText = TextEditingController();

  void createTask({required String task}) {
    setState(() {
      taskList.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          TextField(
            controller: taskText,
            decoration: const InputDecoration(
              labelText: 'Describe your task',
            ),
          ),
          ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (ctx, index) => Dismissible(
                  key: ValueKey(taskList[index]), child: Text(taskList[index])))
          //...taskList.map((item) => Text(item))

          //Widget for the task list
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //show addition dialog

          createTask(task: taskText.text);
        },
      ),
    );
  }
}
