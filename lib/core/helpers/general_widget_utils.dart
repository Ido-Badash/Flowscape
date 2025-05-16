import 'package:flutter/material.dart';

class GeneralWidgetUtils {
  static Widget buildAClipRRPage({Widget? child}) {
    return ClipRRect(borderRadius: BorderRadius.circular(12.0), child: child);
  }
}
