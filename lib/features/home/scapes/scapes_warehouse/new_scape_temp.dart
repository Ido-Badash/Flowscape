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
  
  // HEAD PAGE
  Widget buildHeadPage() {
    return ClassicHeadFrame(
      creator: "Flowscape",
      date: "DATE", // ADD DATE
      textColor: Colors.white.withAlpha(75),
      child: buildHeadPageMainBody(),
    );
  }

  // HEAD PAGE MAIN BODY
  Widget buildHeadPageMainBody() {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Stack(alignment: AlignmentDirectional.center, children: [
          
        ],
      ),
    );
  }

  // PAGE MANAGER
  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1];
  }

  //* - BUILDING PAGES - *//
  // PAGE 1
  Widget buildPage1() {
    return ClassicFrame();
  }
}
