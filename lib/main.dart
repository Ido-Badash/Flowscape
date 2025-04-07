import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// app
import 'features/app/app.dart';
import 'core/styles/themes.dart';

ThemeData appDarkTheme = appDarkThemeData();
ThemeData appLightTheme = appLightThemeData();

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor:
          appDarkTheme.bottomNavigationBarTheme.backgroundColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlowScape",
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      home: FlowScape(),
    );
  }
}