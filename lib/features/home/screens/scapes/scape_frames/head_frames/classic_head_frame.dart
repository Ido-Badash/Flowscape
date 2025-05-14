import 'package:flutter/material.dart';
import '../../scape_utils.dart';

/// Frame for the child in ScapePage class
class ClassicHeadFrame extends StatelessWidget with ScapeUtils {
  final String? title;
  final String? creator;
  final String? date;
  final Widget child;

  const ClassicHeadFrame({
    super.key,
    this.creator,
    this.date,
    this.title,
    this.child = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        child,
        Positioned(top: 5, child: titleTextBlueprint(title, "Untitled")),
        Positioned(
          bottom: 0,
          left: 10,
          child: textBlueprint(creator, "Unknown Creator"),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: textBlueprint(date, "Unknown Date"),
        ),
      ],
    );
  }
}
