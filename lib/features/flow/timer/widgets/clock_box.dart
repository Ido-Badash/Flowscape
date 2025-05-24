import 'package:flutter/material.dart';
import 'clock_controller.dart';

class ClockBox extends StatelessWidget {
  const ClockBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: ClockController());
  }
}