import 'package:flowscape/features/settings/appearance_tile/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelectScreen extends StatefulWidget {
  const ThemeSelectScreen({super.key});

  @override
  State<ThemeSelectScreen> createState() => _ThemeSelectScreenState();
}

class _ThemeSelectScreenState extends State<ThemeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          child: Text("Toggle Theme")),
        ),
    );
  }
}
