import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: const Center(
        child: Text("Tasks", style: TextStyle(color: FlowColors.lightBlueGray)),
      ),
    );
  }
}
