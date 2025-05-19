import 'package:flutter/material.dart';
import './task_logic/task_logic.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Tasker tasker = Tasker();
    // TODO: dupes when isCompleted or isMissed set to a diffrent value in the json file
    tasker.add(Task("#d-512", isCompleted: true));
    tasker.save();
    return Container();
  }
}
