import 'package:flutter/material.dart';
import 'package:flowscape/features/home/scapes/scape_lib.dart';
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
        TextUtils.buildTitleAndText(
          mainAxisAlignment: MainAxisAlignment.center,
          title: TextUtils.buildClassicTitle("Plan Ahead", color: Colors.brown),
          text: TextUtils.buildClassicText(
            "Set weekly goals and break them into daily tasks."
            "It will helps you stay on track and avoid last-minute stress.",
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildPage2() {
    return AssetFrame(
      stackAlignment: AlignmentDirectional.topCenter,
      bgImage: "assets/images/scapes/manage_your_time/page_2.jpg",
      children: [
        TextUtils.buildTitleAndText(
          title: TextUtils.buildClassicTitle(
            "Prioritise",
            color: Color.fromRGBO(188, 164, 140, 1.0),
          ),
          text: TextUtils.buildClassicText(
            "Focus on tougher subjects when you're most productive. Get the hard work done while your mind is fresh!",
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildPage3() {
    return AssetFrame(
      stackAlignment: AlignmentDirectional.topCenter,
      bgImage: "assets/images/scapes/manage_your_time/page_3.jpg",
      children: [
        TextUtils.buildTitleAndText(
          title: TextUtils.buildClassicTitle(
            "Take Breaks",
            color: Color.fromRGBO(24, 20, 20, 1.0),
          ),
          text: TextUtils.buildClassicText(
            "Use the Pomodoro technique: 25 min work, 5 min break. Boosts focus and prevents burnout.",
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildPage4() {
    return AssetFrame(
      stackAlignment: AlignmentDirectional.topCenter,
      bgImage: "assets/images/scapes/manage_your_time/page_4.jpg",
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: TextUtils.buildTitleAndText(
            mainAxisAlignment: MainAxisAlignment.center,
            title: TextUtils.buildClassicTitle(
              "Stay Organised",
              color: Color.fromRGBO(24, 20, 20, 1.0),
            ),
            text: TextUtils.buildClassicText(
              "Keep your notes and assignments neat and in order. A tidy space leads to a clear mind.",
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage5() {
    return AssetFrame(
      stackAlignment: AlignmentDirectional.topCenter,
      bgImage: "assets/images/scapes/manage_your_time/page_5.jpg",
      children: [
        TextUtils.buildTitleAndText(
          title: TextUtils.buildClassicTitle(
            "Eliminate Distractions",
            color: Color.fromRGBO(132, 201, 182, 1),
          ),
          text: TextUtils.buildClassicText(
            "Turn off notifications and stay focused. Increase productivity by minimizing interruptions.",
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
