import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_lib.dart';
import 'package:flowscape/features/home/screens/scapes/scape_utils.dart';
import 'package:flowscape/core/helpers/helpers.dart';

class ManageYourTimeScape extends StatelessWidget with ScapeUtils {
  const ManageYourTimeScape({super.key});

  List<Color> get scapeColors =>
      ColorUtils.colorShades(Colors.indigo, colorsAmount: 10);

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [buildHeadPage(), ...pageManager(buildPagesFunctionList())],
    );
  }

  Widget buildHeadPage() {
    return ClassicHeadFrame(
      creator: "Flowscape",
      date: "15/05/2025",
      title: "Manage Your Time",
      child: ClassicFrame(
        background: scapeColors[0],
      ),
    );
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1, buildPage2, buildPage3, buildPage4];
  }

  Widget buildPage1() {
    return ClassicFrame(background: scapeColors[1], child: null);
  }

  Widget buildPage2() {
    return ClassicFrame(background: scapeColors[2], child: null);
  }

  Widget buildPage3() {
    return ClassicFrame(background: scapeColors[3], child: null);
  }

  Widget buildPage4() {
    return ClassicFrame(background: scapeColors[4], child: null);
  }
}
