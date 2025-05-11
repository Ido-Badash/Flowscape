import 'package:flutter/material.dart';

class ScapePage extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const ScapePage({super.key, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16), // makes the corners round
      ),
      child: child,
    );
  }
}
