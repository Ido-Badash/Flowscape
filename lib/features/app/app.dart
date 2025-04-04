import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/settings/settings.dart';
import 'package:flowscape/features/flow/flow.dart';
import 'package:flowscape/features/home/home.dart';
import 'package:flowscape/features/tasks/tasks.dart';
import 'package:flowscape/features/music/music.dart';
import 'package:flowscape/features/saved_scapes/saved_scapes.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

// utils
import 'package:flowscape/core/utils/general_helpers.dart';

class FlowScape extends StatefulWidget {
  const FlowScape({super.key});

  @override
  State<FlowScape> createState() => _FlowScapeState();
}

class _FlowScapeState extends State<FlowScape> {
  int currentScreenIdx = 2;
  Map<String, int> screens = {
    "Settings": 0,
    "Flow": 1,
    "Home": 2,
    "Tasks": 3,
    "Music": 4,
    "Saved Scapes": 5,
  };

  String getScreenKey() {
    return findKeyByValue(screens, currentScreenIdx) ?? "Unknown screen";
  }

  // checks if a index is a nav screen index
  bool isNavScreen(int index, [int? navScreenIdxMin, int? navScreenIdxMax]) {
    if (index >= (navScreenIdxMin ?? 0) && index < (navScreenIdxMax ?? 5)) {
      return true;
    } else {
      return false;
    }
  }

  // moves to a screen
  void screenMove(int toIndex, [int? navScreenIdxMin, int? navScreenIdxMax]) {
    if (toIndex >= (navScreenIdxMin ?? 0) && toIndex < (navScreenIdxMax ?? screens.length)) {
      setState(() {
        currentScreenIdx = toIndex;
      });
      debugPrint("Navigating to screen index: ${getScreenKey()}");
    } else {
      debugPrint("An error with the `currentScreenIdx`: $currentScreenIdx");
    }
  }

  // moves to a nav screen
  void navScreenMove(int toIndex, [int? navScreenIdxMin, int? navScreenIdxMax]) {
    if (isNavScreen(toIndex, navScreenIdxMin, navScreenIdxMax)) {
      screenMove(toIndex, navScreenIdxMin ?? 0, navScreenIdxMax ?? 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlowColors.darkBlue,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Navigating to saved scapes");
              screenMove(5);
            },
            icon: const Icon(Icons.save),
          ),
        ],
        title: const Text(
          "FlowScape",
          style: TextStyle(fontSize: FlowTextsSizes.h6, color: Colors.white12),
        ),
        toolbarHeight: 45.0,
      ),
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
        selectedItemColor: isNavScreen(currentScreenIdx) ? FlowColors.blue : FlowColors.lightBlueGray,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          navScreenMove(index);
        },
        currentIndex: isNavScreen(currentScreenIdx) ? currentScreenIdx : 2, // home screen by default
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return SettingsScreen();
      case 1:
        return FlowScreen();
      case 2:
        return HomeScreen();
      case 3:
        return TasksScreen();
      case 4:
        return MusicScreen();
      case 5:
        return SavedScapesScreen();
      default:
        return HomeScreen();
    }
  }
}
