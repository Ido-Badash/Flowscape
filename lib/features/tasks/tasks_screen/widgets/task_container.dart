import 'package:flutter/material.dart';
import 'package:flowscape/core/helpers/general_widget_utils.dart';
import '../task_logic/tasker.dart';

class TaskContainer extends StatefulWidget {
  final Widget title;
  final Color background;

  const TaskContainer({
    super.key,
    this.title = const Text("My tasks", style: TextStyle(color: Colors.white)),
    this.background = Colors.grey,
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
        child: ListView(
          children: [_buildTitle(), _buildTasks(), _buildNewTaskButton()],
        ),
      ),
    );
  }

  Widget _buildTasks() {
    return Flexible(flex: 10, child: _defaultPad(Column(children: [
      
        ],)));
  }

  Widget _buildTitle() {
    return Flexible(flex: 5, child: _defaultPad(widget.title));
  }

  Widget _buildNewTaskButton() {
    return Flexible(
      flex: 2,
      child: _defaultPad(
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
      ),
    );
  }

  void _createNewTask() {
    debugPrint("A new task was created");
  }

  Widget _defaultPad(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      child: child,
    );
  }
}
