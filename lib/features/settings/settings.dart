import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.black,
      body: const Center(
        child: Text("Settings", style: TextStyle(color: FlowColors.white)),
      ),
    );
  }
}
