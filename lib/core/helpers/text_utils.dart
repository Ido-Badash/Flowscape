import 'package:flutter/material.dart';

class TextUtils {
  static Shadow textOutlineShadow({Color? color}) {
    return Shadow(
      color: color ?? Colors.black,
      offset: const Offset(1, 1),
      blurRadius: 0, // No blur, sharp shadow
    );
  }
}
