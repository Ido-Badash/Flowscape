import 'package:flowscape/features/settings/appearance/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelectScreen extends StatefulWidget {
  const ThemeSelectScreen({super.key});

  @override
  State<ThemeSelectScreen> createState() => _ThemeSelectScreenState();
}

class _ThemeSelectScreenState extends State<ThemeSelectScreen> {
  IconData currentIconTheme = Icons.nightlight_round_sharp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            spacing: 8.0,
            children: [
              const Text("Toggle Theme", style: TextStyle(fontSize: 16)),
              ElevatedButton(
                onPressed: () => toggleTheme(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(currentIconTheme, size: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    setState(() {
      currentIconTheme =
          currentIconTheme == Icons.nightlight_round_sharp
              ? Icons.wb_sunny_rounded
              : Icons.nightlight_round_sharp;
    });
  }
}
