import 'package:flutter/material.dart';
import 'package:flowscape/features/home/screens/scapes/scape_lib.dart';
import 'package:flowscape/features/home/screens/scapes/scape_utils.dart';
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
    return buildAClipRRPage(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            "assets/images/scapes/manage_your_time/head_page.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            gaplessPlayback: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildHowToMasterText(), buildTimeManagementText()],
          ),
        ],
      ),
    );
  }

  Widget buildTimeManagementText() {
    return Text(
      "TIME MANAGEMENT",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        shadows: [TextUtils.textOutlineShadow()],
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
    return buildAClipRRPage(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(color: Colors.white70),
          Positioned(
            top: 30,
            child: Text(
              "Plan Ahead",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [TextUtils.textOutlineShadow()],
                decoration: TextDecoration.underline,
                decorationColor: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            left: 0,
            child: Text(
              "Set weekly goals and break them into daily tasks.\n"
              "Helps you stay on track and avoid last-minute stress.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                shadows: [TextUtils.textOutlineShadow()],
              ),
            ),
          ),
        ],
      ),
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
}
