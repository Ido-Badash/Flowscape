import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/settings/settings.dart';
import 'package:flowscape/features/flow/flow.dart';
import 'package:flowscape/features/home/home.dart';
import 'package:flowscape/features/tasks/tasks.dart';
import 'package:flowscape/features/music/music.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

// utils
import 'package:flutter/services.dart';

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
  };

  String? findKeyByValue(Map map, int value) {
    for (var entry in map.entries) {
      if (entry.value == value) {
        return entry.key;
      }
    }
    return null;
  }

  String _getScreenKey() {
    return findKeyByValue(screens, currentScreenIdx) ?? "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add a full bg image
      appBar: AppBar(
        backgroundColor: FlowColors.darkBlue,
        actions: [
          IconButton(
            onPressed: () {
              Future.delayed(Duration.zero, () {
                debugPrint("Exiting app...");
                SystemNavigator.pop();
              });
            },
            icon: const Icon(Icons.exit_to_app_rounded),
          ),
        ],
        title: const Text(
          "FlowScape",
          style: TextStyle(fontSize: FlowTextsSizes.h2, color: Colors.white12),
        ),
        toolbarHeight: 45.0,
      ),
      body: Center(
        child:
            _buildScreen(currentScreenIdx),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: FlowColors.darkBlue,
        currentIndex: currentScreenIdx,
        unselectedItemColor: FlowColors.lightBlueGray,
        selectedItemColor: FlowColors.blue,
        type: BottomNavigationBarType.fixed,
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
        onTap: (int index) {
          if (currentScreenIdx >= 0 && currentScreenIdx <= screens.length) {
            setState(() {
              currentScreenIdx = index;
            });
            debugPrint("Navigating to screen index: ${_getScreenKey()}");
          } else {
            debugPrint(
              "An error with the `currentScreenIdx`: $currentScreenIdx",
            );
          }
        },
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
      default:
        return HomeScreen();
    }
  }
}
