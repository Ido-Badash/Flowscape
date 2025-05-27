import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/settings/settings.dart';
import 'package:flowscape/features/flow/flow.dart';
import 'package:flowscape/features/home/home.dart';
import 'package:flowscape/features/todo/todo.dart';
import 'package:flowscape/features/music/music.dart';

// screen handlers
import 'package:flowscape/core/screen_handle/screen_checks.dart';

class FlowScape extends StatefulWidget {
  const FlowScape({super.key});

  @override
  State<FlowScape> createState() => _FlowScapeState();
}

class _FlowScapeState extends State<FlowScape> {
  int currentScreenIdx = 2;
  final List<Widget> pages = [
    const SettingsPage(),
    const FlowPage(),
    const HomePage(),
    const TasksPage(),
    const MusicPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(currentScreenIdx),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Flow",
            icon: Icon(Icons.terrain_outlined),
          ),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Tasks", icon: Icon(Icons.list_alt)),
          BottomNavigationBarItem(label: "Music", icon: Icon(Icons.music_note)),
        ],
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
    return pages[index];
  }
}
