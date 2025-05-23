import 'package:flutter/material.dart';
import 'package:flowscape/core/helpers/general_widget_utils.dart';
import '../task_logic/tasker.dart';

class TaskContainer extends StatelessWidget {
  final Tasker? tasker;
  final Text title;
  final Color background;

  const TaskContainer({
    super.key,
    this.tasker,
    this.title = const Text("My tasks", style: TextStyle(color: Colors.white)),
    this.background = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Container(
        color: background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: title,
        ),
      ),
    );
  }
}
