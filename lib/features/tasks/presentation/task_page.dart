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
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(RepositoryProvider.of<TaskRepo>(context)),
      child: const TaskView(),
    );
  }
}
