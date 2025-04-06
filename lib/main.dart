import 'package:flutter/material.dart';

// app
import 'features/app/app.dart';
import 'theme.dart';

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
      theme: appThemeData(),
      home: FlowScape(),
    );
  }
}
