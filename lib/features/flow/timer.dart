import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/flowbg_images.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

final List<String> bgImages = getRandomImagesList(5);

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: SizedBox.expand(
        child: Image.asset(
          bgImages[0],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
