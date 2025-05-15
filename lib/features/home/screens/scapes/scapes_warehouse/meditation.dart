import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes_widgets.dart';
import 'package:flowscape/features/home/screens/scapes/scape_utils.dart';
import 'package:flowscape/core/helpers/color_utils.dart';

class MeditationScape extends StatelessWidget with ScapeUtils {
  const MeditationScape({super.key});

  List<Color> get scapeColors => ColorUtils.colorShades(
    Colors.indigo,
    colorsAmount: buildPagesFunctionList().length,
  );

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [buildHeadPage(), ...pageManager(buildPagesFunctionList())],
    );
  }

  Widget buildHeadPage() {
    return ClassicHeadFrame(
      title: "Meditation",
      creator: "By FlowScape",
      date: "13/05/2025",
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[800],
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1, buildPage2, buildPage3, buildPage4];
  }

  Widget buildPage1() {
    return ClassicFrame(background: scapeColors[0], child: null);
  }

  Widget buildPage2() {
    return ClassicFrame(background: scapeColors[1], child: null);
  }

  Widget buildPage3() {
    return ClassicFrame(background: scapeColors[2], child: null);
  }

  Widget buildPage4() {
    return ClassicFrame(background: scapeColors[3], child: null);
  }
}
