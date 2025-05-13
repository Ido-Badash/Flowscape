import 'package:flutter/material.dart';

abstract class ScapeFrame extends StatelessWidget {
  const ScapeFrame({
    super.key,
    required this.children,
    this.title,
    this.creator,
    this.date,
  });

  final List<Widget> children;
  final Widget? title;
  final Widget? creator;
  final Widget? date;

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
