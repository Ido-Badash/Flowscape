/*

TASK VIEW
the UI of the tasks screen, displays all the tasks in the repo

- use BlocBuilder

*/

import 'package:flowscape/features/tasks/domain/models/task_model.dart';
import 'package:flowscape/features/tasks/presentation/task_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskBox(context),
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add, size: 24),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          debugPrint(
            'REBUILD: ${tasks.map((t) => '${t.id} ${t.text}').toList()}',
          );
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, idx) {
              final task = tasks[idx];
              return buildTasksListTile(context, task);
            },
          );
        },
      ),
    );
  }

  Widget buildTasksListTile(BuildContext context, Task task) {
    final taskCubit = context.read<TaskCubit>();
    return ListTile(
      title: Text(
        task.text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ),
      ),
      leading: Checkbox(
        value: task.isComplete,
        onChanged: (value) => taskCubit.toggleTask(task),
      ),
      trailing: IconButton(
        onPressed: () => taskCubit.deleteTask(task),
        icon: const Icon(CupertinoIcons.trash, size: 20),
      ),
    );
  }

  void _showAddTaskBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final taskCubit = context.read<TaskCubit>();
        final textController = TextEditingController();
        return AlertDialog(
          content: TextField(
            controller: textController,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                taskCubit.addTask(textController.text);
                Navigator.of(context).pop();
              },
              child: const Text("add"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("cancel"),
            ),
          ],
        );
      },
    );
  }
}
