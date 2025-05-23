import 'package:flutter/material.dart';

class GeneralWidgetUtils {
  static Widget buildAClipRRPage({Widget? child, double radius = 12.0}) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: child);
  }
}
