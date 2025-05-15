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
      child: ClassicFrame(
        color: Colors.amber,
        child: buildMainBody(),
      ),
    );
  }

  Widget buildMainBody() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1723572215980-2bc603c97001",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
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
        fontFamily: "Times New Roman",
        shadows: [TextUtils.textOutlineShadow()],
      ),
    );
  }

  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1, buildPage2, buildPage3, buildPage4];
  }

  Widget buildPage1() {
    return ClassicFrame(color: scapeColors[1], child: null);
  }

  Widget buildPage2() {
    return ClassicFrame(color: scapeColors[2], child: null);
  }

  Widget buildPage3() {
    return ClassicFrame(color: scapeColors[3], child: null);
  }

  Widget buildPage4() {
    return ClassicFrame(color: scapeColors[4], child: null);
  }
}
