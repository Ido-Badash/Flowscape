/*

TASK PAGE
providing for task cubit and task view (UI)

- use BlocProvider

*/

import 'package:flowscape/features/tasks/domain/repo/task_repo.dart';
import 'package:flowscape/features/tasks/presentation/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_view.dart';

class TaskPage extends StatelessWidget {
  final TaskRepo taskRepo;

  const TaskPage({super.key, required this.taskRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(taskRepo),
      child: const TaskView());
  }
}