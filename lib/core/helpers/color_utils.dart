import 'package:flutter/material.dart';

class ColorUtils {
  static List<Color> colorShades(
    MaterialColor? color, {
    int colorsAmount = 10,
    bool darkToLight = true,
  }) {
    return List.generate(colorsAmount, (int idx) {
      if (darkToLight) {
        return color![(colorsAmount - idx - 1) * 100] ?? color;
      } else {
        return color![(idx + 1) * 100] ?? color;
      }
    });
  }
}