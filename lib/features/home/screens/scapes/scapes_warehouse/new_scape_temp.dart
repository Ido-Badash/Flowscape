import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_lib.dart';
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
    return ClassicHeadFrame(
      creator: "Flowscape",
      date: "DATE", // TODO: Add date
      textColor: Colors.white.withAlpha(75),
      child: buildHeadPageMainBody(),
    );
  }

  Widget buildHeadPageMainBody() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(alignment: AlignmentDirectional.center, children: [
            
          ],
        ),
      ),
    );
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1];
  }

  Widget buildPage1() {
    return ClassicFrame();
  }
}
