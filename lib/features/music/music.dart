import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      appBar: AppBar(
        backgroundColor: FlowColors.darkBlue,
        actions: [],
        title: const Text(
          "Music",
          style: TextStyle(fontSize: FlowTextsSizes.h6, color: Colors.white12),
        ),
        toolbarHeight: 45.0,
      ),
      body: const Center(
        child: Text("Music", style: TextStyle(color: FlowColors.lightBlueGray)),
      ),
    );
  }
}
