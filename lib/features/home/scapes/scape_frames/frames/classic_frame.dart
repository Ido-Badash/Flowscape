import 'package:flutter/material.dart';

/// Frame for the child in ScapePage class
class ClassicFrame extends StatelessWidget {
  final Color? color;
  final Widget? background;
  final Widget? child;

  const ClassicFrame({super.key, this.child, this.background, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: background ?? const SizedBox.shrink(),
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
