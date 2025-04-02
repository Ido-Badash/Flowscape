import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.black,
      body: const Center(
        child: Text("Music", style: TextStyle(color: FlowColors.white)),
      ),
    );
  }
}
