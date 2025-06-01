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
    // cubit
    final todoCubit = context.read<TodoCubit>();

    // SCAFFOLD
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoBox(context);
          debugPrint("Floating action button pressed");
        },
        elevation: 0, // Removes the shadow
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(Icons.add),
      ),

      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          // List View
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // get each todo from todos list
              final todo = todos[index];

              return buildListTile(context, todo, todoCubit);
            },
          );
        },
      ),
    );
  }

  Widget buildListTile(BuildContext context, Todo todo, TodoCubit todoCubit) {
    return ListTile(
      // text
      title: buildListTileTitle(context, todo),

      // check box
      leading: buildListTileLeading(context, todo, todoCubit),

      // delete button
      trailing: buildListTileTrailing(context, todo, todoCubit),
    );
  }

  // List Tile Title
  Widget buildListTileTitle(BuildContext context, Todo todo) {
    return Text(
      todo.text,
      style: TextStyle(
        fontSize: 16,
        decoration:
            todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }

  // List Tile Leading
  Widget buildListTileLeading(
    BuildContext context,
    Todo todo,
    TodoCubit todoCubit,
  ) {
    return Checkbox(
      // TODO: add a cool animation later
      value: todo.isCompleted,
      onChanged: (value) {
        todoCubit.toggleCompletion(todo);
        debugPrint("Todo toggled: ${todo.text}, completed: $value");
      },
      checkColor: Colors.green,
      side: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
    );
  }

  // List Tile Trailing
  Widget buildListTileTrailing(
    BuildContext context,
    Todo todo,
    TodoCubit todoCubit,
  ) {
    return IconButton(
      icon: const Icon(CupertinoIcons.trash, size: 22),
      onPressed: () {
        todoCubit.deleteTodo(todo);
        debugPrint("Todo deleted: ${todo.text}");
      },
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
            content: buildShowDialogContent(context, textController),
            actions: buildShowDialogActions(context, textController, todoCubit),
          ),
    );
  }

  Widget buildShowDialogContent(
    BuildContext context,
    TextEditingController textController,
  ) {
    return TextField(
      controller: textController,
      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      decoration: const InputDecoration(hintText: 'Enter todo...'),
    );
  }

  List<Widget> buildShowDialogActions(
    BuildContext context,
    TextEditingController textController,
    TodoCubit todoCubit,
  ) {
    return [
      // cancel button
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          debugPrint("Todo adding cancelled");
        },
        child: const Text('Cancel'),
      ),

      // add button
      TextButton(
        onPressed: () {
          if (textController.text.isNotEmpty) {
            // check if text is not empty
            // add todo
            todoCubit.addTodo(textController.text);
          }
          Navigator.of(context).pop();
          debugPrint("Todo added: ${textController.text}");
        },
        child: const Text('Add'),
      ),
    ];
  }
}
