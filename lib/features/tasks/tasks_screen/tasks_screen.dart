import 'package:flutter/material.dart';
import 'widgets/task_container.dart';
import 'package:flowscape/core/helpers/text_utils.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTaskColumn(context),
        _buildSidePlaceholder(), // Placeholder for the left side of the screen
      ],
    );
  }

  Widget _buildTaskColumn(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTaskContainer(context, "Daily"),
            const SizedBox(height: 12.0), // Separator
            _buildTaskContainer(context, "Weekly"),
            const SizedBox(height: 12.0), // Separator
            _buildTaskContainer(context, "Custom"),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskContainer(BuildContext context, String label) {
    return Expanded(
      child: TaskContainer(
        title: buildTaskContainerTitle(context, data: label),
        background: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget _buildSidePlaceholder() {
    return Flexible(flex: 1, child: Container());
  }

  Widget buildTaskContainerTitle(
    BuildContext context, {
    String data = "My tasks",
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      child: Text(
        data,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSecondary,
          shadows: [TextUtils.textOutlineShadow()],
        ),
      ),
    );
  }
}
