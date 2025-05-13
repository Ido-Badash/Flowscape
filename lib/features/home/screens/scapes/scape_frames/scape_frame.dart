import 'package:flutter/material.dart';

/// This class is used to create a frame for the child in ScapePage class
abstract class ScapeFrame extends StatelessWidget {
  final Widget? child;

  const ScapeFrame({super.key, this.child = const SizedBox.shrink()});

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
