import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes.dart';

class MeditationScape extends StatelessWidget {
  const MeditationScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [
        ScapePage(child: ClassicHeadFrame(child: Container(color: Colors.indigo[800]))),
        ScapePage(child: ClassicFrame(child: Container(color: Colors.indigo[700]))),
        ScapePage(child: ClassicFrame(child: Container(color: Colors.indigo[600]))),
        ScapePage(child: ClassicFrame(child: Container(color: Colors.indigo[500]))),
      ],
    );
  }
}
