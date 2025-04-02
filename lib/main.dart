import 'package:flutter/material.dart';
import 'features/app/app.dart'; // Imports FlowHome

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
        fontFamily: "Raleway",
      ),
      home: const FlowHome(), // Set the home screen
    );
  }
}
