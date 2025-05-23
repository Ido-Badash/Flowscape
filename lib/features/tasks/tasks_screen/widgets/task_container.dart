import 'package:flutter/material.dart';
import 'package:flowscape/core/helpers/general_widget_utils.dart';
import '../tasks_lib.dart';

class TaskContainer extends StatefulWidget {
  final Widget title;
  final Color background;
  final Map<String, List<Widget?>> tasks;
  final String jsonKey;

  /// The [jsonKey] is used to identify the task in the database, it can be ["d", "w", "c"]
  const TaskContainer({
    super.key,
    this.title = const Text("My tasks", style: TextStyle(color: Colors.white)),
    this.background = Colors.grey,
    this.tasks = const {},
    this.jsonKey = "d",
  });

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  @override
  Widget build(BuildContext context) {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Container(
        color: widget.background,
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTitle(), _buildTasks(), _buildNewTaskButton()],
        ),
      ),
    );
  }

  Widget _buildTasks() {
    return _defaultPad(Column(children: [Container()])); // TODO: make the tasks map into 3 parts
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
      // TODO: use the CreateTask widget to make a new on and put it into the tasks map
    });
    debugPrint("A new task was created");
    debugPrint("Tasks list amount: ${widget.tasks.length}");
  }

  Widget _defaultPad(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      child: child,
    );
  }
}
