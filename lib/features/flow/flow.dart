import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart'; // ignore: unused_import

class FlowPage extends StatefulWidget {
  const FlowPage({super.key});

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      appBar: AppBar(
        backgroundColor: FlowColors.darkBlue,
        actions: [],
        title: const Text(
          "Flow",
          style: TextStyle(fontSize: FlowTextsSizes.h6, color: Colors.white12),
        ),
        toolbarHeight: 45.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Flow")],
        ),
      ),
    );
  }
}
