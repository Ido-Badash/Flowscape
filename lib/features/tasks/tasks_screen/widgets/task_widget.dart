import 'package:flutter/material.dart';
import '../task_logic/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(width: 10, height: 10,);
  }
}