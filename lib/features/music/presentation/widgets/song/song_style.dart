/*

SONG STYLE
used for styling the Song widget

*/

// imports
import 'package:flutter/material.dart';

class SongStyle {
  final Color? imageBg;
  final TextStyle? titleStyle;
  final TextStyle? artistStyle;
  final TextStyle? durationStyle;

  const SongStyle({
    this.imageBg,
    this.titleStyle,
    this.artistStyle,
    this.durationStyle,
  });
}
