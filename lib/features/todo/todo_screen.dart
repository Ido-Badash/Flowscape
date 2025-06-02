import 'package:flowscape/features/todo/domain/repository/todo_repo.dart';
import 'package:flowscape/features/todo/presentation/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
Displays all the tasks
*/

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get the repo
    final todoRepo = Provider.of<TodoRepo>(context, listen: false);
    return TodoPage(todoRepo: todoRepo);
  }
}
