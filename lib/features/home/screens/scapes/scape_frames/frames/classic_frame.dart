import 'package:flutter/material.dart';

/// Frame for the child in ScapePage class
class ClassicFrame extends StatelessWidget {
  final Color? background;
  final Widget? child;

  const ClassicFrame({super.key, this.child, this.background});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
