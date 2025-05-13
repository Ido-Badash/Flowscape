import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes.dart';

class MeditationScape extends StatelessWidget {
  const MeditationScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(
      creator: const Text("creator name"),
      date: const Text("date"),
      title: const Text("title", style: TextStyle(),),
      children: [
        ScapePage(child: ClassicFrame(),)
      ],
    );
  }
}
