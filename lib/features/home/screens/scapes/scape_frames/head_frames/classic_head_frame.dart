import 'package:flutter/material.dart';

/// Frame for the child in ScapePage class
class ClassicHeadFrame extends StatelessWidget {
  final Widget? title;
  final Widget? creator;
  final Widget? date;
  final Widget child;

  const ClassicHeadFrame({
    super.key,
    this.child = const SizedBox.shrink(),
    this.creator = const Text(
      "Unknown Creator",
      style: TextStyle(fontSize: 14),
    ),
    this.date = const Text("Unknown Date", style: TextStyle(fontSize: 14)),
    this.title = const Text("No Title", style: TextStyle(fontSize: 20)),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        child,
        Positioned(top: 5, child: title ?? SizedBox.shrink()),
        Positioned(bottom: 0, left: 10, child: creator ?? SizedBox.shrink()),
        Positioned(bottom: 0, right: 10, child: date ?? SizedBox.shrink()),
      ],
    );
  }
}
