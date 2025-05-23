import 'package:flutter/material.dart';
import 'package:flowscape/core/helpers/general_widget_utils.dart';
import '../tasks_lib.dart';

class TaskContainer extends StatefulWidget {
  final String jsonKey = "d";
  final Widget title;
  final Color background;

  /// The [jsonKey] is used to identify the task in the database, it can be ["d", "w", "c"]
  const TaskContainer({
    super.key,
    this.title = const Text("My tasks", style: TextStyle(color: Colors.white)),
    this.background = Colors.grey,
  });

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  List<Widget> tasks = [];

  @override
  Widget build(BuildContext context) {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Container(
        color: widget.background,
        alignment: Alignment.topLeft,
        child: ListView(
          children: [_buildTitle(), _buildTasks(), _buildNewTaskButton()],
        ),
      ),
    );
  }

  Widget _buildTasks() {
    return _defaultPad(Column(children: tasks));
  }

  Widget _buildTitle() {
    return _defaultPad(widget.title);
  }

  Widget _buildNewTaskButton() {
    return _defaultPad(
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _createNewTask,
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                size: 20,
              ),
              Text("New task"),
            ],
          ),
        ),
      ),
    );
  }

  void _createNewTask() {
    // adds a TaskWidget to the `tasks` list
    setState(() {
      tasks.add(CreateTask(jsonKey: widget.jsonKey,));
    });
    debugPrint("A new task was created");
    debugPrint("Tasks list amount: ${tasks.length}");
  }

  Widget _defaultPad(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      child: child,
    );
  }
}
