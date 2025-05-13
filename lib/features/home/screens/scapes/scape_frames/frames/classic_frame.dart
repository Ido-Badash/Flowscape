import 'package:flutter/material.dart';

/// Frame for the child in ScapePage class
class ClassicFrame extends StatelessWidget {
  final Widget? child;

  const ClassicFrame({super.key, this.child = const SizedBox.shrink()});

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
