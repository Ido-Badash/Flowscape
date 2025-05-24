/*

TASK VIEW
the UI of the tasks screen, displays all the tasks in the repo

- use BlocBuilder

*/

import 'package:flowscape/features/tasks/domain/models/task.dart';
import 'package:flowscape/features/tasks/presentation/task_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskCubit taskCubit = context.read<TaskCubit>();

    return Scaffold(
      // FLOATINGACTIONBUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskBox(context),
        elevation: 0, // Removes the shadow
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add, size: 24),
      ),

      // BODY
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, idx) {
              // gets a task
              final task = tasks[idx];

              // List tile UI
              return buildTasksListTile(context, task, taskCubit);
            },
          );
        },
      ),
    );
  }

  Widget buildTasksListTile(
    BuildContext context,
    Task task,
    TaskCubit taskCubit,
  ) {
    return ListTile(
      // text
      title: Text(
        task.text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ),
      ),

      // checkbox
      leading: Checkbox(
        value: task.isComplete,
        onChanged: (value) => taskCubit.toggleTask(task),
      ),

      // delete
      trailing: IconButton(
        onPressed: () => taskCubit.deleteTask(task),
        icon: const Icon(CupertinoIcons.trash, size: 20),
      ),
    );
  }

  // show dialog box for the user to make a new task
  void _showAddTaskBox(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final textController = TextEditingController();
    final actionButtons = buildActionsButtons(
      context,
      taskCubit: taskCubit,
      textController: textController,
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(
              controller: textController,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: actionButtons,
          ),
    );
  }

  // building the action button
  List<Widget> buildActionsButtons(
    BuildContext context, {
    TaskCubit? taskCubit,
    TextEditingController? textController,
  }) {
    return [
      buildAddTaskButton(
        context,
        taskCubit: taskCubit,
        textController: textController,
      ),
      buildCancelTaskButton(context),
    ];
  }

  // building the cancle task button
  Widget buildCancelTaskButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text("cancel"),
    );
  }

  // building the add task button
  Widget buildAddTaskButton(
    BuildContext context, {
    TaskCubit? taskCubit,
    TextEditingController? textController,
  }) {
    return TextButton(
      onPressed: () {
        taskCubit?.addTask(textController!.text);
        Navigator.of(context).pop();
      },
      child: const Text("add"),
    );
  }
}
