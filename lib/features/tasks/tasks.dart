import 'package:flowscape/features/tasks/domain/repo/task_repo.dart';
import 'package:flutter/material.dart';
import 'tasks_screen.dart';

class TasksPage extends StatefulWidget {
  final TaskRepo taskRepo;

  const TasksPage({super.key, required this.taskRepo});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  Widget? currentBody;

  @override
  void initState() {
    super.initState();
    currentBody = TasksScreen(taskRepo: widget.taskRepo);
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
