import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: const Center(
        child: Text("Settings", style: TextStyle(color: FlowColors.lightBlueGray)),
      ),
    );
  }
}
