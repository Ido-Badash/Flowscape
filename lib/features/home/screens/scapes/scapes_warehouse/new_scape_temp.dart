import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_widgets/scapes_widgets.dart';
import 'package:flowscape/features/home/screens/scapes/scape_utils.dart';

class NameScape extends StatelessWidget with ScapeUtils {
  const NameScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [buildHeadPage(), ...pageManager(buildPagesFunctionList())],
    );
  }

  Widget buildHeadPage() {
    return ClassicHeadFrame();
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1];
  }

  Widget buildPage1() {
    return ClassicFrame();
  }
}
