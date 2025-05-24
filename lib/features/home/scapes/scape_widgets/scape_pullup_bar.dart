import 'package:flutter/material.dart';
import 'dart:ui';

class ScapePullUpBar extends StatelessWidget {
  final Widget? child;
  final List<Widget> barWidgets;
  final Color? barColor;
  final double sigmaX;
  final double sigmaY;
  final TileMode? tileMode;
  final bool blur;
  final Function()? onDoubleTap;

  const ScapePullUpBar({
    super.key,
    this.child,
    this.barWidgets = const [SizedBox.shrink()],
    this.barColor,
    this.sigmaX = 5.0,
    this.sigmaY = 5.0,
    this.tileMode,
    this.blur = true,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild = child ?? const SizedBox.shrink();

    if (onDoubleTap != null) {
      currentChild = wrapWithDetectorOnDoubleTap(currentChild, onDoubleTap);
    }

    if (blur) {
      currentChild = wrapWithBlur(currentChild);
    }

    return Stack(
      children: [
        currentChild,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [blur ? buildRowBar() : const SizedBox()],
        ),
      ],
    );
  }

  Widget buildRowBar() {
    return Container(
      decoration: BoxDecoration(
        color: barColor ?? const Color.fromARGB(100, 63, 81, 181),
        borderRadius: BorderRadius.circular(16), // makes the corners round
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 0.5,
        children: [...barWidgets],
      ),
    );
  }

  Widget wrapWithBlur(Widget? child) {
    return ClipRect(
      // makes sure the child dosent expand out
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
          tileMode: tileMode,
        ),
        child: child,
      ),
    );
  }

  GestureDetector wrapWithDetectorOnDoubleTap(
    Widget? child,
    Function()? onDoubleTap,
  ) {
    return GestureDetector(onDoubleTap: onDoubleTap, child: child);
  }
}
