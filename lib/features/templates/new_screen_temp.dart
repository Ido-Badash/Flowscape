import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text("Name", style: TextStyle(color: FlowColors.lightBlueGray)),
      ),
    );
  }
}
