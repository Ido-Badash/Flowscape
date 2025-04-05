import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

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
          "assets/images/flowbgs/flowbg_1.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
