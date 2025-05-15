import 'package:flutter/material.dart';

mixin ScapeUtils {
  /// Unpackes the list of functions and returns a list of widgets.
  /// This is useful for creating a list of pages in a Scape.
  List<Widget> pageManager(List<Widget Function()> pages) {
    return List.generate(pages.length, (int idx) => pages[idx]());
  }

  Widget textBlueprint(String? text, [String? nullText = "Unknown String"]) {
    return Text(
      text ?? nullText ?? "Unknown Text",
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  Widget titleTextBlueprint(
    String? text, [
    String? nullText = "Unknown String",
  ]) {
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
