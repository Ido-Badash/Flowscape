import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_lib.dart';

class TextFrame extends ClassicFrame {
  final String? mainText;
  final String? secondaryText;
  final String? tertiaryText;
  final TextStyle? mainTextStyle;
  final TextStyle? secondaryTextStyle;
  final TextStyle? tertiaryTextStyle;

  const TextFrame({
    super.key,
    super.background,
    super.child,
    this.mainText,
    this.secondaryText,
    this.tertiaryText,
    this.mainTextStyle,
    this.secondaryTextStyle,
    this.tertiaryTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ClassicFrame(
      background: background,
      child: Positioned(
        top: 50,
        left: 0,
        right: 0,
        child: Column(
          spacing: 16.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildMainText(), buildSecondaryAndTertiaryText()],
        ),
      ),
    );
  }

  Widget buildMainText() {
    return Text(
      mainText ?? "Main text not found!",
      style:
          mainTextStyle ?? const TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  Widget buildSecondaryAndTertiaryText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.0,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            secondaryText ?? "Secondary text not found!",
            style:
                secondaryTextStyle ??
                const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            tertiaryText ?? "Tertiary text not found!",
            style:
                tertiaryTextStyle ??
                const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
