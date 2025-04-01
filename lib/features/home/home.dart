import 'package:flowscape/core/data/quotes.dart';
import 'package:flutter/material.dart';

// screens
import 'package:flowscape/features/flow/flow.dart'; // ignore: unused_import
import 'package:flowscape/features/music/music.dart'; // ignore: unused_import
import 'package:flowscape/features/settings/settings.dart'; // ignore: unused_import

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

class FlowHome extends StatefulWidget {
  const FlowHome({super.key});

  @override
  State<FlowHome> createState() => _FlowHomeState();
}

class _FlowHomeState extends State<FlowHome> {
  int currentScreenIdx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add a full bg image
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "18:45", // replace with irl time 24 hours clock style
              style: TextStyle(
                color: FlowColors.blue,
                fontSize: FlowTextsSizes.h1,
              ),
            ),
            Text(
              randomQuote(),
              style: TextStyle(
                fontSize: FlowTextsSizes.h4,
                color: FlowColors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // when pressed, goes to flow screen
                debugPrint("Navigating to flow mode...");
              },
              child: Text("Flow", style: TextStyle(color: FlowColors.blue)),
            ),
          ],
        ),
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
        currentIndex: currentScreenIdx,
        unselectedItemColor: FlowColors.gray,
        selectedItemColor: FlowColors.blue,
        onTap: (int index) {
          setState(() {
            currentScreenIdx = index;
          });
          debugPrint("Navigating to screen index: $currentScreenIdx");
        },
      ),
    );
  }
}
