import 'package:flutter/material.dart';
import 'dart:ui';

class ScapePullUpBar extends StatelessWidget {
  final Widget? child;
  final double sigmaX;
  final double sigmaY;
  final TileMode? tileMode;
  final bool blur;
  final Function()? onDoubleTap;

  const ScapePullUpBar({
    super.key,
    this.child,
    this.sigmaX = 5.0,
    this.sigmaY = 5.0,
    this.tileMode,
    this.blur = false,
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

    return currentChild;
  }

  ImageFiltered wrapWithBlur(Widget? child) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: sigmaX,
        sigmaY: sigmaY,
        tileMode: tileMode ?? TileMode.clamp,
      ),
      child: child,
    );
  }

  GestureDetector wrapWithDetectorOnDoubleTap(
    Widget? child,
    Function()? onDoubleTap,
  ) {
    return GestureDetector(onDoubleTap: onDoubleTap, child: child);
  }
}
