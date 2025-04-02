import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/home/home.dart';
import 'package:flowscape/features/music/music.dart';
import 'package:flowscape/features/settings/settings.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

// utils
import 'package:flowscape/core/utils/general_helpers.dart';

class FlowHome extends StatefulWidget {
  const FlowHome({super.key});

  @override
  State<FlowHome> createState() => _FlowHomeState();
}

class _FlowHomeState extends State<FlowHome> {
  int currentScreenIdx = 1;
  Map<String, int> screens = {"Settings": 0, "Home": 1, "Music": 2};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add a full bg image
      backgroundColor: FlowColors.black,
      appBar: AppBar(
        backgroundColor: FlowColors.darkBlue,
        centerTitle: true,
        title: const Text(
          "FlowScape",
          style: TextStyle(fontSize: FlowTextsSizes.h2, color: Colors.white12),
        ),
        toolbarHeight: 45.0,
      ),
      body: Center(
        child:
            // Settings
            currentScreenIdx == 0
                ? SettingsScreen()
                // Home
                : currentScreenIdx == 1
                ? HomeScreen()
                // Music
                : MusicScreen(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Music", icon: Icon(Icons.music_note)),
        ],
        backgroundColor: FlowColors.darkBlue,
        currentIndex: currentScreenIdx,
        unselectedItemColor: FlowColors.white,
        selectedItemColor: FlowColors.blue,
        onTap: (int index) {
          setState(() {
            currentScreenIdx = index;
          });
          debugPrint("Navigating to screen index: ${_getScreenKey()}");
        },
      ),
    );
  }

  String? _getScreenKey() {
    return findKeyByValue(screens, currentScreenIdx);
  }
}
