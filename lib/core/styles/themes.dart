import 'package:flutter/material.dart';

// styles
import 'colors.dart';
import 'texts_sizes.dart';

ThemeData appDarkThemeData = ThemeData(
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
    primary: FlowColors.textTertiaryDark,
    onPrimary: FlowColors.textPrimaryDark,
    secondary: FlowColors.surfaceDark,
    onSecondary: FlowColors.textSecondaryDark,
    surface: FlowColors.backgroundDark,
    onSurface: FlowColors.textDisabledDark,
    error: Colors.red,
    onError: Colors.white,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: FlowColors.surfaceDark,
    unselectedItemColor: FlowColors.textSecondaryDark,
    selectedItemColor: FlowColors.accentBlueDark,
  ),

  expansionTileTheme: ExpansionTileThemeData(
    textColor: FlowColors.textSecondaryDark,
  ),

  iconTheme: IconThemeData(color: FlowColors.textTertiaryDark),
);

ThemeData appLightThemeData = ThemeData(
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

  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: FlowColors.textTertiaryLight,
    onPrimary: FlowColors.textPrimaryLight,
    secondary: FlowColors.surfaceLight,
    onSecondary: FlowColors.textSecondaryLight,
    surface: FlowColors.backgroundLight,
    onSurface: FlowColors.textDisabledLight,
    error: FlowColors.errorRedLight,
    onError: Colors.white,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: FlowColors.surfaceLight,
    unselectedItemColor: FlowColors.textSecondaryLight,
    selectedItemColor: FlowColors.accentBlueLight,
  ),

  expansionTileTheme: const ExpansionTileThemeData(
    textColor: FlowColors.textSecondaryLight,
  ),

  iconTheme: const IconThemeData(color: FlowColors.textTertiaryLight),
);
