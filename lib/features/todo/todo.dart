import 'package:flutter/material.dart';
import 'todo_screen.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  Widget? currentBody;

  @override
  void initState() {
    super.initState();
    currentBody = const TasksScreen();
  }

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
      body: currentBody,
    );
  }
}
