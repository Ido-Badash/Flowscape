import 'package:flutter/material.dart';

mixin HeadFrameMixin {
  Widget textBlueprint(String? text, [String? nullText = "Unknown String"]) {
    return Text(
      text ?? nullText ?? "Unknown Text",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  Widget titleTextBlueprint(String? text, [String? nullText = "Unknown String"]) {
    return Text(
      text ?? nullText ?? "Unknown Title",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
