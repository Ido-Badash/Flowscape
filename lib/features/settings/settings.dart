import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      appBar: AppBar(
        backgroundColor: FlowColors.bars,
        actions: [],
        title: Text(
          "Settings",
          style: TextStyle(fontSize: FlowTextsSizes.h6, color: FlowColors.text4),
        ),
        toolbarHeight: 45.0,
      ),
      body: Center(
        child: Text(
          "Settings",
          style: TextStyle(color: FlowColors.text2),
        ),
      ),
    );
  }
}
