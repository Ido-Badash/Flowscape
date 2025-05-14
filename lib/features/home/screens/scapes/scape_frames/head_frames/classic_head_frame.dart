import 'package:flutter/material.dart';
import 'head_frame.dart';

/// Frame for the child in ScapePage class
class ClassicHeadFrame extends StatelessWidget with HeadFrame {
  final String? title;
  final String? creator;
  final String? date;
  final Widget child;

  const ClassicHeadFrame({
    super.key,
    this.creator = "Unknown Creator",
    this.date = "Unknown Date",
    this.title = "Untitled",
    this.child = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        child,
        Positioned(top: 5, child: textBlueprint(title, nullText: "Untitled")),
        Positioned(
          bottom: 0,
          left: 10,
          child: textBlueprint(creator, nullText: "Unknown Creator"),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: textBlueprint(date, nullText: "Unknown Date"),
        ),
      ],
    );
  }
}
