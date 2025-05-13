import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes.dart';

class MeditationScape extends StatelessWidget {
  const MeditationScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [
        ClassicHeadFrame(
          title: const Text("Meditation"),
          creator: const Text("By FlowScape"),
          date: const Text("13/05/2025"),
          child: Container(color: Colors.indigo[800])
          ),
        ClassicFrame(child: Container(color: Colors.indigo[700])),
        ClassicFrame(child: Container(color: Colors.indigo[600])),
        ClassicFrame(child: Container(color: Colors.indigo[500])),
      ],
    );
  }
}
