import 'package:flutter/material.dart';

mixin ScapeUtils {
  /// Unpackes the list of functions and returns a list of widgets.
  /// This is useful for creating a list of pages in a Scape.
  List<Widget> pageManager(List<Widget Function()> pages) {
    return List.generate(pages.length, (int idx) => pages[idx]());
  }

  Widget buildAClipRRPage({Widget? child}) {
    return ClipRRect(borderRadius: BorderRadius.circular(12.0), child: child);
  }
}
