import 'package:flutter/material.dart';

class FlowColors {
  static Color body = const Color.fromRGBO(25, 34, 49, 1.0); // for screens body
  static Color bars = const Color.fromRGBO(
    30,
    41,
    59,
    1.0,
  ); // for app bars and nav bar

  static Color text1 = const Color.fromRGBO(
    248,
    250,
    252,
    1.0,
  ); // for normal text like in the nav icon buttons
  static Color text2 = const Color.fromRGBO(
    203,
    213,
    225,
    1.0,
  ); // for nav bar icons buttons and placeholder text
  static Color text3 = const Color.fromRGBO(
    148,
    163,
    184,
    1.0,
  ); // stuff like the quote genrator and icon in home-scapes screen
  static Color text4 = const Color.fromRGBO(
    100,
    116,
    139,
    1.0,
  ); // for page title in top left

  static Color selected = const Color.fromRGBO(
    56,
    189,
    248,
    1.0,
  ); // for nav bar icons buttons

  static Color tooltip = const Color.fromRGBO(
    71,
    85,
    105,
    0.8,
  ); // for pages icon buttons tooltips in top right

  static void invertAllColors() {
    body = _invertRGBOColor(body);
    bars = _invertRGBOColor(bars);
    text1 = _invertRGBOColor(text1);
    text2 = _invertRGBOColor(text2);
    text3 = _invertRGBOColor(text3);
    text4 = _invertRGBOColor(text4);
    selected = _invertRGBOColor(selected);
    tooltip = _invertRGBOColor(tooltip);
  }

  static Color _invertRGBOColor(Color color) {
    return Color.fromRGBO(
      255 - color.r.toInt(),
      255 - color.g.toInt(),
      255 - color.b.toInt(),
      color.a,
    );
  }
}
