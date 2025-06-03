import 'package:flutter/material.dart';
import 'package:flowscape/features/home/scapes/scape_lib.dart';
import 'package:flowscape/core/helpers/helpers.dart';

class FableScape extends StatelessWidget with ScapeUtils {
  const FableScape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [buildHeadPage(), ...pageManager(buildPagesFunctionList())],
    );
  }

  // HEAD PAGE (Book Cover)
  Widget buildHeadPage() {
    return AssetFrame(
      bgImage: "assets/images/scapes/fable/head_page.jpg",
      children: [
        ClassicHeadFrame(
          creator: "Aesop",
          date: "03/06/2025",
          textColor: Colors.white.withAlpha(200),
          child: buildHeadPageMainBody(),
        ),
      ],
    );
  }

  // HEAD PAGE MAIN BODY (Book Title & Author)
  Widget buildHeadPageMainBody() {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The Tortoise and the Hare",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[600],
                letterSpacing: 1.2,
                shadows: TextUtils.textStroke(),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "by Aesop",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // PAGE MANAGER
  List<Widget Function()> buildPagesFunctionList() {
    return [
      ...[
        buildPage1,
        buildPage2,
        buildPage3,
        buildPage4,
        buildPage5,
        buildPage6,
        buildPage7,
      ].map((pageFunction) => () => buildPageAsset(pageFunction())),
      () => buildPageAsset(
        buildPage8(),
        bgImage: "assets/images/scapes/fable/page_8.jpg",
      ),
    ];
  }

  // Page asset image loader
  Widget buildPageAsset(Widget child, {String? bgImage}) {
    return AssetFrame(
      bgImage: bgImage ?? "assets/images/scapes/fable/page_bg.jpg",
      children: [child],
    );
  }

  //* - BOOK PAGES - *//
  // "The Tortoise and the Hare" split into 8 pages

  Widget buildPage1() {
    return ClassicFrame(
      child: _bookText(
        "Once upon a time, there was a speedy hare who bragged about how fast he could run. Tired of hearing him boast, the slow and steady tortoise challenged him to a race.",
      ),
    );
  }

  Widget buildPage2() {
    return ClassicFrame(
      child: _bookText(
        "All the animals in the forest gathered to watch. The hare ran down the road for a while and then paused to rest. He looked back at the slow tortoise and cried out, 'How do you expect to win this race when you are walking along at your slow, slow pace?'",
      ),
    );
  }

  Widget buildPage3() {
    return ClassicFrame(
      child: _bookText(
        "The hare stretched himself out alongside the road and fell asleep, thinking, 'There is plenty of time to relax.'",
      ),
    );
  }

  Widget buildPage4() {
    return ClassicFrame(
      child: _bookText(
        "Meanwhile, the tortoise plodded on and on. After a time, he passed the place where the hare was sleeping. But the hare slept on very peacefully.",
      ),
    );
  }

  Widget buildPage5() {
    return ClassicFrame(
      child: _bookText(
        "When the hare finally woke up, the tortoise was near the finish line. The hare now ran his swiftest, but he could not overtake the tortoise in time.",
      ),
    );
  }

  Widget buildPage6() {
    return ClassicFrame(
      child: _bookText(
        "All the animals cheered as the tortoise crossed the finish line. The hare was left feeling foolish for being so overconfident.",
      ),
    );
  }

  Widget buildPage7() {
    return ClassicFrame(
      child: _bookText(
        "The tortoise smiled and said, 'Slow and steady wins the race.' The hare learned a valuable lesson that day.",
      ),
    );
  }

  Widget buildPage8() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Moral",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[500],
            letterSpacing: 1.2,
            shadows: TextUtils.textStroke(),
            decoration: TextDecoration.underline,
            decorationColor: Colors.indigo[500]!,
            decorationThickness: 1.5,
          ),
        ),
        ClassicFrame(
          child: Center(
            child: SelectableText(
              "Never underestimate the value of persistence and humility.",
              style: const TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  // Helper for book page text
  Widget _bookText(String text) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Colors.white, height: 1.4),
        textAlign: TextAlign.center,
      ),
    );
  }
}
