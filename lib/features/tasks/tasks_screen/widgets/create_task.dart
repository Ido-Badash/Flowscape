import 'package:flutter/material.dart';
import '../tasks_lib.dart';

class CreateTask extends StatelessWidget {
  final String jsonKey;

  const CreateTask({super.key, required this.jsonKey});

  @override
  Widget build(BuildContext context) {
    return TaskWidget(task: createTheTask());
  }

  // TODO: Implement the task creation, where the can input all parameters
  Task createTheTask() {
    return Task(
      "#1",
      jsonKey,
      name: getNameInput(),
      description: getDescriptionInput(),
      dueDate: getDueDateInput(),
    );
  }

  String getNameInput() {
    return "Task name";
  }

  String getDescriptionInput() {
    return "Task description";
  }

  String getDueDateInput() {
    return "Task due date";
  }
}
