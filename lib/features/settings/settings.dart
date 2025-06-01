import 'package:flowscape/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget? currentBody = const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildSettingsAppBar(), body: currentBody);
  }

  // APPBAR
  AppBar buildSettingsAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      actions: const [],
      title: Text(
        "Settings",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        ),
      ),
      toolbarHeight: 45.0,
    );
  }
}
