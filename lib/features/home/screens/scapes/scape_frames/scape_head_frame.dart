import 'package:flutter/material.dart';

abstract class ScapeHeadFrame extends StatelessWidget {
  const ScapeHeadFrame({
    super.key,
    this.children = const [],
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
