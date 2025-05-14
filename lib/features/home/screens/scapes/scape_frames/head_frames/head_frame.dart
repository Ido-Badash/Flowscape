import 'package:flutter/material.dart';

mixin HeadFrame {
  Widget textBlueprint(String? text, {String nullText = "Unknown Text"}) {
    return Text(
      text ?? nullText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget titleTextBlueprint(String? text, {String nullText = "Unknown Text"}) {
    return Text(
      text ?? nullText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
