import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes.dart';

class MeditationScape extends StatelessWidget {
  const MeditationScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [
        ScapePage(
          child: ClassicHeadFrame(
            title: const Text("Meditation"),
            creator: const Text("By FlowScape"),
            date: const Text("13/05/2025"),
            child: Container(color: Colors.indigo[800])
            ),
        ),
        ScapePage(
          child: ClassicFrame(child: Container(color: Colors.indigo[700])),
        ),
        ScapePage(
          child: ClassicFrame(child: Container(color: Colors.indigo[600])),
        ),
        ScapePage(
          child: ClassicFrame(child: Container(color: Colors.indigo[500])),
        ),
      ],
    );
  }
}
