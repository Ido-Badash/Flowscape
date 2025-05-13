import 'package:flutter/material.dart';

class ScapeHeadFrame extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final Widget? creator;
  final Widget? date;

  const ScapeHeadFrame({
    super.key,
    this.child = const SizedBox.shrink(),
    this.title,
    this.creator,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
