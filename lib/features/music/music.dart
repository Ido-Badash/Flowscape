import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: const Center(
        child: Text("Music", style: TextStyle(color: FlowColors.lightBlueGray)),
      ),
    );
  }
}
