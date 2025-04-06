import 'package:flutter/material.dart';

// styles
import 'core/styles/colors.dart';
import 'core/styles/texts_sizes.dart';

ThemeData appThemeData() {
  return ThemeData(
    fontFamily: "Default",

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: FlowTextsSizes.h1),
      titleMedium: TextStyle(fontSize: FlowTextsSizes.h2),
      titleSmall: TextStyle(fontSize: FlowTextsSizes.h3),
      displayLarge: TextStyle(fontSize: FlowTextsSizes.h4),
      displayMedium: TextStyle(fontSize: FlowTextsSizes.h5),
      displaySmall: TextStyle(fontSize: FlowTextsSizes.h6),
      headlineLarge: TextStyle(fontSize: FlowTextsSizes.h7),
      headlineMedium: TextStyle(fontSize: FlowTextsSizes.h8),
      headlineSmall: TextStyle(fontSize: FlowTextsSizes.h9),
      bodyLarge: TextStyle(fontSize: FlowTextsSizes.h10),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: FlowColors.text3,
      onPrimary: FlowColors.text1,
      secondary: FlowColors.bars,
      onSecondary: FlowColors.text2,
      surface: FlowColors.body,
      onSurface: FlowColors.text4,
      error: Colors.red,
      onError: Colors.white,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: FlowColors.bars,
      unselectedItemColor: FlowColors.text2,
      selectedItemColor: FlowColors.selected,
    ),

    iconTheme: IconThemeData(color: FlowColors.text3),
  );
}
