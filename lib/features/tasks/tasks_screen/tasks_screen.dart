import 'package:flutter/material.dart';
import './task_logic/task_logic.dart';
import 'widgets/task_container.dart';
import 'package:flowscape/core/helpers/text_utils.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Tasker tasker = Tasker();
    tasker.add(Task("#1", "d", isCompleted: false));
    tasker.save();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        // This makes the children of the Column stretch to fill the available width.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: TaskContainer(
              title: buildTaskContainerTitle(context, data: "Daily"),
            ),
          ),

          const SizedBox(height: 24.0), // Separator

          Expanded(
            child: TaskContainer(
              title: buildTaskContainerTitle(context, data: "Weekly"),
            ),
          ),

          const SizedBox(height: 24.0), // Separator

          Expanded(
            child: TaskContainer(
              title: buildTaskContainerTitle(context, data: "Custom"),
            ),
          ),
        ],
      ),
    );
  }

  Text buildTaskContainerTitle(
    BuildContext context, {
    String data = "My tasks",
  }) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onPrimary,
        shadows: [TextUtils.textOutlineShadow()],
      ),
    );
  }
}
