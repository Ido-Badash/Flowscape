import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/settings/settings.dart';
import 'package:flowscape/features/flow/flow.dart';
import 'package:flowscape/features/home/home.dart';
import 'package:flowscape/features/tasks/tasks.dart';
import 'package:flowscape/features/music/music.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

// utils
import 'package:flowscape/core/utils/general_helpers.dart';

// screen handlers
import 'package:flowscape/core/screen_handle/screen_checks.dart';

class FlowScape extends StatefulWidget {
  const FlowScape({super.key});

  @override
  State<FlowScape> createState() => _FlowScapeState();
}

class _FlowScapeState extends State<FlowScape> {
  int currentScreenIdx = 2;
  Map<String, int> pages = {
    "Settings": 0,
    "Flow": 1,
    "Home": 2,
    "Tasks": 3,
    "Music": 4,
  };

  String getScreenKey() {
    return findKeyByValue(pages, currentScreenIdx) ?? "Unknown screen";
  }

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
        backgroundColor: FlowColors.darkBlue,
        unselectedItemColor: FlowColors.lightBlueGray,
        selectedItemColor: FlowColors.blue,
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
    switch (index) {
      case 0:
        return SettingsPage();
      case 1:
        return FlowPage();
      case 2:
        return HomePage();
      case 3:
        return TasksPage();
      case 4:
        return MusicPage();
      default:
        return HomePage();
    }
  }
}
