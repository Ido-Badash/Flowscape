import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class FlowScreen extends StatelessWidget {
  const FlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: const Center(
        child: Text("Flow", style: TextStyle(color: FlowColors.lightBlueGray)),
      ),
    );
  }
}
