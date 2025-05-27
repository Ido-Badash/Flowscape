/*

TO DO VIEW: responsible for UI

- use BlocBuilder

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowscape/features/todo/domain/models/todo.dart';
import 'package:flowscape/features/todo/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    // todo cubit
    final todoCubit = context.read<TodoCubit>();

    // SCAFFOLD
    return Scaffold(
      // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoBox(context),
        child: const Icon(Icons.add),
      ),

      // BLOC BUILDER
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          // List View
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // get individual todo from todos list
              final todo = todos[index];

              // List Tile UI
              return ListTile(
                // text
                title: Text(
                  todo.text,
                    style: TextStyle(
                    fontSize: 16,
                    decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                    color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),

                // check box
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                  checkColor: Colors.green,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),

                // delete button
                trailing: IconButton(
                  icon: const Icon(CupertinoIcons.trash, size: 22),
                  onPressed: () => todoCubit.deleteTodo(todo),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(
              controller: textController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              )),
            actions: [
              // cancel button
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),

              // add button
              TextButton(
                onPressed: () {
                  if (textController.text.isNotEmpty) { // check if text is not empty
                    // add todo
                    todoCubit.addTodo(textController.text);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }
}
