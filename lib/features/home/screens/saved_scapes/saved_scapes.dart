import 'package:flutter/material.dart';

class SavedScapesScreen extends StatelessWidget {
  const SavedScapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Saved Scapes",
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
