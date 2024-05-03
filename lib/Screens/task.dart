import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

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
      taskText.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: taskText,
              decoration: const InputDecoration(
                labelText: 'Your task',
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: taskList.length,
                  itemBuilder: (ctx, index) => Dismissible(
                    key: UniqueKey(), //ValueKey(taskList[index]),
                    child: Text(taskList[index]),
                    onDismissed: (direction) {
                      //taskList.remove();
                    },
                  ),
                ),
              ),
            )
            //...taskList.map((item) => Text(item))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          createTask(task: taskText.text);
        },
      ),
    );
  }
}
