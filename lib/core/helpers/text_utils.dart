import 'package:flutter/material.dart';

class TextUtils {
  static Shadow textOutlineShadow({Color? color, Offset? offset}) {
    return Shadow(
      color: color ?? Colors.black,
      offset: offset ?? Offset.zero,
      blurRadius: 0, // No blur, sharp shadow
    );
  }

  static List<Shadow> textStroke() {
    return [
      textOutlineShadow(offset: Offset(1, 0)),
      textOutlineShadow(offset: Offset(-1, 0)),
      textOutlineShadow(offset: Offset(0, 1)),
      textOutlineShadow(offset: Offset(0, -1)),
    ];
  }
}
