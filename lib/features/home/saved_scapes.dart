import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class SavedScapesScreen extends StatelessWidget {
  const SavedScapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: const Center(
        child: Text(
          "Saved Scapes",
          style: TextStyle(color: FlowColors.lightBlueGray),
        ),
      ),
    );
  }
}
