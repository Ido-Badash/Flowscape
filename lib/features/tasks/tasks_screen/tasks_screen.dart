import 'package:flowscape/features/tasks/tasks_screen/tasks_lib.dart';
import 'package:flutter/material.dart';
import 'package:flowscape/core/helpers/text_utils.dart';
import 'package:flowscape/core/helpers/read_from_json.dart';
import 'dart:io';

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
            _buildTaskContainer(context, "Daily", jsonKey: "d"),
            const SizedBox(height: 12.0), // Separator
            _buildTaskContainer(context, "Weekly", jsonKey: "w"),
            const SizedBox(height: 12.0), // Separator
            _buildTaskContainer(context, "Custom", jsonKey: "c"),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskContainer(
    BuildContext context,
    String label, {
    String jsonKey = "d",
  }) {
    return Expanded(
      child: TaskContainer(
        title: _buildTaskContainerTitle(context, data: label),
        background: Theme.of(context).colorScheme.secondary,
        tasks: _buildTasks(context, jsonKey: jsonKey),
        jsonKey: jsonKey,
      ),
    );
  }


  Map<String, List<Widget?>> _buildTasks(context, {String jsonKey = "d"}) {
    var tasksWidgetForm = {
      "completed": <Widget?>[],
      "missed": <Widget?>[],
      "onGoing": <Widget?>[]
    };
    // TODO: get the json decoded data and turn each task into a [Task] object widget,
    // and then turn it to a TaskWidget object

    return tasksWidgetForm;
  }

  Widget _buildSidePlaceholder() {
    return Flexible(flex: 1, child: Container());
  }

  Widget _buildTaskContainerTitle(
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
