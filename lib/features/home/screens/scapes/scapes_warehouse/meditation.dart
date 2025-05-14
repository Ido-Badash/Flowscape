import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes.dart';

class MeditationScape extends StatelessWidget {
  const MeditationScape({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.indigo[700],
      Colors.indigo[600],
      Colors.indigo[700],
      Colors.indigo[800],
    ];

    return Scape(
      children: [
        ClassicHeadFrame(
          title: "Meditation",
          creator: "By FlowScape",
          date: "13/05/2025",
          child: Container(
            decoration: BoxDecoration(
              color: Colors.indigo[800],
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        ...colors.map(
          (color) => ClassicFrame(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
