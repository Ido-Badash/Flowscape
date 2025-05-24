import 'package:flutter/material.dart';
import 'package:flowscape/features/home/scapes/scape_lib.dart';
import 'package:flowscape/core/helpers/helpers.dart';

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
      date: "DATE", // td: Add date
      textColor: Colors.white.withAlpha(75),
      child: buildHeadPageMainBody(),
    );
  }

  Widget buildHeadPageMainBody() {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: const Stack(alignment: AlignmentDirectional.center, children: [
          
        ],
      ),
    );
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1];
  }

  Widget buildPage1() {
    return const ClassicFrame();
  }
}
