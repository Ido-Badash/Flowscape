import 'package:flowscape/features/flow/timer/timer_page.dart';
import 'package:flutter/material.dart';

// screens
import 'flow_screen.dart';

class FlowPage extends StatefulWidget {
  const FlowPage({super.key});

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  Widget? currentBody;

  @override
  void initState() {
    super.initState();
    currentBody = FlowScreen(child: TimerPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [],
        title: Text(
          "Flow",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
          ),
        ),
        toolbarHeight: 45.0,
      ),
      body: currentBody,
    );
  }
}
