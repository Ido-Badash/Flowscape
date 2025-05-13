import 'package:flutter/material.dart';

// screens
import 'screens/timer/timer.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [],
        title: Text(
          "Flow",
          style: TextStyle(fontSize: Theme.of(context).textTheme.displaySmall?.fontSize),
        ),
        toolbarHeight: 45.0,
      ),
      body: currentBody,
    );
  }
}
