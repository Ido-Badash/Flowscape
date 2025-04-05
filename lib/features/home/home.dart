import 'package:flutter/material.dart';

// screens
import 'scapes.dart';
import 'saved_scapes.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

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
      backgroundColor: FlowColors.body,
      appBar: AppBar(
        backgroundColor: FlowColors.bars,
        actions: [buildSavedScapesTooltip(), buildScapesTooltip()],
        title: Text(
          "Home",
          style: TextStyle(fontSize: FlowTextsSizes.h6, color: FlowColors.text4),
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
      icon: Icon(Icons.save, color: FlowColors.text4),
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
      icon: Icon(Icons.chrome_reader_mode, color: FlowColors.text4),
    );
  }

  BoxDecoration tooltipBoxDecoration() {
    return BoxDecoration(
      gradient: RadialGradient(
        colors: [FlowColors.tooltip, Colors.transparent],
        radius: 2.5,
      ),
    );
  }
}
