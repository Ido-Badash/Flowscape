/*

TASK PAGE
providing for task cubit and task view (UI)

- use BlocProvider

*/

import 'package:flowscape/features/tasks/tasks_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskRepo = Provider.of<TaskRepo>(context, listen: false);
    return BlocProvider<TaskCubit>(
      create: (_) => TaskCubit(taskRepo),
      child: const TaskView(),
    );
  }
}
