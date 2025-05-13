import 'package:flutter/material.dart';
import '../scape_head_frame.dart';

/// Frame for the child in ScapePage class
class ClassicHeadFrame extends ScapeHeadFrame {
  const ClassicHeadFrame({
    super.key,
    super.children = const [],
    super.title,
    super.creator,
    super.date,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        children.isNotEmpty ? children[0] : Container(color: Colors.red),
        Positioned(top: 5, child: title ?? SizedBox.shrink()),
        Positioned(bottom: 0, left: 10, child: creator ?? SizedBox.shrink()),
        Positioned(bottom: 0, right: 10, child: date ?? SizedBox.shrink()),
      ],
    );
  }
}
