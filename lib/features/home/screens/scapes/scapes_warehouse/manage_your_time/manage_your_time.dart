import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_lib.dart';
import 'package:flowscape/core/helpers/helpers.dart';

class ManageYourTimeScape extends StatelessWidget with ScapeUtils {
  const ManageYourTimeScape({super.key});

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
      textColor: Colors.white.withAlpha(75),
      child: buildHeadPageMainBody(),
    );
  }

  Widget buildHeadPageMainBody() {
    return AssetFrame(
      stackAlignment: AlignmentDirectional.center,
      bgImage: "assets/images/scapes/manage_your_time/head_page.jpg",
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildHowToMasterText(), buildTimeManagementText()],
        ),
      ],
    );
  }

  Widget buildTimeManagementText() {
    return Text(
      "TIME MANAGEMENT",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        shadows: TextUtils.textStroke(),
      ),
    );
  }

  Widget buildHowToMasterText() {
    return Text(
      "how to master",
      style: TextStyle(
        color: Colors.white60,
        fontSize: 16,
        fontFamily: "Times New Roman",
        shadows: [TextUtils.textOutlineShadow()],
      ),
    );
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1, buildPage2, buildPage3, buildPage4, buildPage5];
  }

  Widget buildPage1() {
    return AssetFrame(
      stackAlignment: AlignmentDirectional.topCenter,
      bgImage: "assets/images/scapes/manage_your_time/page_1.jpg",
      children: [
        Positioned(
          top: 30,
          child: Text(
            "Plan Ahead",
            style: TextStyle(
              color: Colors.yellow[700],
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [TextUtils.textOutlineShadow()],
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 251, 192, 45),
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 0,
          left: 0,
          child: Text(
            "Set weekly goals and break them into daily tasks.\n"
            "It will helps you stay on track and avoid last-minute stress.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              shadows: TextUtils.textStroke(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage2() {
    return buildAClipRRPage(child: null);
  }

  Widget buildPage3() {
    return buildAClipRRPage(child: null);
  }

  Widget buildPage4() {
    return buildAClipRRPage(child: null);
  }

  Widget buildPage5() {
    return buildAClipRRPage(child: null);
  }

  /*
  Prioritise

  Focus on tougher subjects when you're most productive. Get the hard work done while your mind is fresh!


  Take Breaks

  Use the Pomodoro technique: 25 min work, 5 min break. Boosts focus and prevents burnout.


  Stay Organised

  Keep your notes and assignments neat and in order. A tidy space leads to a clear mind.

  
  Eliminate Distractions

  Turn off notifications and stay focused. Increase productivity by minimizing interruptions.

  */
}
