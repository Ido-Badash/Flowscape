import 'package:flowscape/features/tasks/domain/repo/task_repo.dart';
import 'package:flowscape/features/tasks/presentation/task_page.dart';
import 'package:flutter/material.dart';

/*

displays all the tasks

*/

class TasksScreen extends StatelessWidget {
  final TaskRepo taskRepo;

  const TasksScreen({super.key, required this.taskRepo});

  @override
  Widget build(BuildContext context) {
    return TaskPage(taskRepo: taskRepo);
  }
}
