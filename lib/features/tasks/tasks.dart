import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [],
        title: Text(
          "Tasks",
          style: TextStyle(fontSize: Theme.of(context).textTheme.displaySmall?.fontSize),
        ),
        toolbarHeight: 45.0,
      ),
      body: Center(
        child: Text("Tasks"),
      ),
    );
  }
}
