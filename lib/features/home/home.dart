import 'package:flutter/material.dart';

// screens
import 'scapes.dart';
import 'saved_scapes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? currentBody = ScapesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [buildSavedScapesIconButton(), buildScapesIconButton()],
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
          ),
        ),
        toolbarHeight: 45.0,
      ),
      body: currentBody,
    );
  }

  IconButton buildSavedScapesIconButton() {
    return IconButton(
      tooltip: "Saved Scapes",
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      onPressed: () {
        debugPrint("Navigating to saved scapes");
        setState(() {
          currentBody = SavedScapesScreen();
        });
      },
      icon: Icon(Icons.save),
    );
  }

  IconButton buildScapesIconButton() {
    return IconButton(
      tooltip: "Scapes",
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      onPressed: () {
        debugPrint("Navigating to scapes");
        setState(() {
          currentBody = ScapesScreen();
        });
      },
      icon: Icon(Icons.chrome_reader_mode),
    );
  }
}
