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
        Positioned(
          top: 5,
          child: Text(
            title ?? "Untitled",
            style: const TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: Text(
            creator ?? "Unknown Creator",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Text(
            date ?? "Unknown Date",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
