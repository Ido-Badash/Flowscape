import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/settings/settings.dart';
import 'package:flowscape/features/flow/flow.dart';
import 'package:flowscape/features/home/home.dart';
import 'package:flowscape/features/todo/todo.dart';

// screen handlers
import 'package:flowscape/core/screen_handle/screen_checks.dart';

class FlowScape extends StatefulWidget {
  const FlowScape({super.key});

  @override
  State<FlowScape> createState() => _FlowScapeState();
}

class _FlowScapeState extends State<FlowScape> {
  int currentScreenIdx = 2;

  // PAGES
  final List<Widget> pages = [
    const SettingsPage(),
    const FlowPage(),
    const HomePage(),
    const TasksPage(),
  ];

  // PAGES ICONS
  final List<Widget> pagesIcons = [
    Icon(Icons.settings),
    Icon(Icons.terrain_outlined),
    Icon(Icons.home),
    Icon(Icons.list_alt),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(currentScreenIdx),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(pages.length, (int idx) {
          final String label = pages[idx].toString();
          return BottomNavigationBarItem(
            label: label.substring(0, label.length - 4),
            icon: pagesIcons[idx],
          );
        }),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentScreenIdx = screenIdxCheck(index, pages.length) ?? 0;
          });
        },
        currentIndex: currentScreenIdx,
      ),
    );
  }

  Widget _buildScreen(int index) {
    debugPrint(
      "------------------------------------------------------------------------------\n"
      "Navigating to screen: ${pages[index].runtimeType}"
    );
    return pages[index];
  }
}
