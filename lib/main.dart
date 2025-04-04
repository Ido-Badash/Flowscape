import 'package:flutter/material.dart';
import 'features/app/app.dart';

const TextStyle white = TextStyle(color: Colors.white);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlowScape",
      theme: ThemeData(
        fontFamily: "Default",
        textTheme: const TextTheme(
          bodyLarge: white,
          bodyMedium: white,
          bodySmall: white,
        ),
      ),
      home: FlowScape(), // Set the home screen
    );
  }
}
