import 'package:flutter/material.dart';
import './task_logic/task_logic.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Tasker tasker = Tasker();
    tasker.add(Task("#512", "d", isCompleted: false));
    tasker.save();
    return Container();
  }
}
