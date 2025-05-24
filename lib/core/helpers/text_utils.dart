import 'package:flutter/material.dart';

class TextUtils {
  static Text buildClassicTitle(
    String data, {
    Color? color,
    double fontSize = 20,
  }) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        shadows: [textOutlineShadow()],
        decoration: TextDecoration.underline,
        decorationColor: color,
      ),
    );
  }

  static Text buildClassicText(
    String data, {
    Color? color,
    double fontSize = 20,
  }) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        shadows: textStroke(),
      ),
    );
  }

  static Shadow textOutlineShadow({Color? color, Offset? offset}) {
    return Shadow(
      color: color ?? Colors.black,
      offset: offset ?? Offset.zero,
      blurRadius: 0, // No blur, sharp shadow
    );
  }

  static List<Shadow> textStroke() {
    return [
      textOutlineShadow(offset: const Offset(1, 0)),
      textOutlineShadow(offset: const Offset(-1, 0)),
      textOutlineShadow(offset: const Offset(0, 1)),
      textOutlineShadow(offset: const Offset(0, -1)),
    ];
  }

  static List<Widget> buildTitleAndText({
    required Text title,
    required Text text,
    double titleTop = 30,
    double textTop = 60,
  }) {
    return [
      Positioned(top: titleTop, child: title),
      Positioned(top: textTop, right: 0, left: 0, child: text),
    ];
  }
}
