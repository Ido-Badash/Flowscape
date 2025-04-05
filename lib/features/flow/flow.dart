import 'package:flutter/material.dart';

// screens
import 'timer.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart'; // ignore: unused_import

class FlowPage extends StatefulWidget {
  const FlowPage({super.key});

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  Widget? currentBody = TimerScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      appBar: AppBar(
        backgroundColor: FlowColors.bars,
        actions: [],
        title: Text(
          "Flow",
          style: TextStyle(fontSize: FlowTextsSizes.h6, color: FlowColors.text4),
        ),
        toolbarHeight: 45.0,
      ),
      body: currentBody,
    );
  }
}
