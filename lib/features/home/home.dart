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
        actions: [buildSavedScapesTooltip(), buildScapesTooltip()],
        title: Text(
          "Home",
          style: TextStyle(fontSize: Theme.of(context).textTheme.displaySmall?.fontSize),
        ),
        toolbarHeight: 45.0,
      ),
      body: currentBody,
    );
  }

  Tooltip buildSavedScapesTooltip() {
    return Tooltip(
      message: "Saved Scapes",
      decoration: tooltipBoxDecoration(),
      child: buildSavedScapesIconButton(),
    );
  }

  Tooltip buildScapesTooltip() {
    return Tooltip(
      message: "Scapes",
      decoration: tooltipBoxDecoration(),
      child: buildScapesIconButton(),
    );
  }

  IconButton buildSavedScapesIconButton() {
    return IconButton(
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

  BoxDecoration tooltipBoxDecoration() {
    return BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.75)
    );
  }
}
