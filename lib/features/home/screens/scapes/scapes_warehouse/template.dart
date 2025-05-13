import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/widgets/scapes.dart';

class NameScape extends StatelessWidget {
  const NameScape({super.key});

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
