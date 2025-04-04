import 'package:flutter/material.dart';

int? screenIdxCheck(int toIndex, int screenIdxMax, [int? screenIdxMin]) {
  if (toIndex >= (screenIdxMin ?? 0) && toIndex < screenIdxMax) {
    return toIndex;
  } else {
    debugPrint("An error in the `screenIdxCheck` func, idx given: $toIndex");
    return null;
  }
}

