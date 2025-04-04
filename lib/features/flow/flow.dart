import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart'; // ignore: unused_import

class FlowScreen extends StatefulWidget {
  const FlowScreen({super.key});

  @override
  State<FlowScreen> createState() => _FlowScreenState();
}

class _FlowScreenState extends State<FlowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Flow")],
        ),
      ),
    );
  }
}
