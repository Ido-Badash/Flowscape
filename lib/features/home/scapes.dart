import 'package:flutter/material.dart';
import 'dart:math';

// data
import 'package:flowscape/core/data/quotes.dart';

// widgets
import 'widgets/scape.dart';

Widget page(Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16), // makes the corners round
    ),
  );
}

final String firstQuote = randomQuote();

// --------------------------------------------------------------------------
final Random random = Random();
List<Color> randomColors = [
  Colors.blue.shade900,
  Colors.lightBlue.shade900,
  Colors.indigo.shade900,
  Colors.cyan.shade900,
  Colors.teal.shade900,
  Colors.blueGrey.shade900,
];
Color getRandomColor() => randomColors[random.nextInt(randomColors.length)];
List<Widget> generateRandomPages(int count) {
  return List.generate(
    count,
    (index) => page(getRandomColor()),
  );
}
final List scapes = List.generate(
  12,
  (index) => Scape(
    bodies: generateRandomPages(random.nextInt(7) + 3), // Random count between 3 and 15
  ),
);
// --------------------------------------------------------------------------

class ScapesScreen extends StatefulWidget {
  const ScapesScreen({super.key});

  @override
  State<ScapesScreen> createState() => _ScapesScreenState();
}

class _ScapesScreenState extends State<ScapesScreen> {
  final PageController scapesPageController = PageController();
  String currentQuote = firstQuote;

  void updateQuote() {
    currentQuote = randomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildBackToTopButton(),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        controller: scapesPageController,
        itemBuilder: pageViewItemBuilder,
        itemCount: 10,
      ),
    );
  }

  Widget pageViewItemBuilder(BuildContext context, int index) {
    Widget currentItem = Container(color: Theme.of(context).colorScheme.error);
    switch (index) {
      case 0:
        currentItem = buildTopScapesPageViewItem();
      default:
        if (index - 1 >= 0 && index - 1 < scapes.length) {
          // if targetItem is in scapes
          currentItem = scapes[index - 1];
        } else {
          currentItem = Text(
            "Error: Scape not found!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 16,
            ),
          );
        }
    }
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12, left: 12),
      child: Center(child: currentItem),
    );
  }

  void scapesPageViewScrollUp() {
    scapesPageController.jumpTo(0.0); // goes up in the list view
  }

  Widget buildScrollToSeeText() {
    return const Center(
      child: Text(
        "Scroll to see Scapes",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
      ),
    );
  }

  Widget buildBackToTopButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Tooltip(
          message: "Back to top",
          preferBelow: false,
          child: FloatingActionButton(
            onPressed: scapesPageViewScrollUp,
            mini: true, // makes the button small
            shape: const CircleBorder(),
            elevation: 0, // to remove the black foggy effect
            child: const Icon(Icons.arrow_upward_rounded),
          ),
        ),
      ],
    );
  }

  /// The build for the top quote area
  Widget buildTopScapesPageViewItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 4), // balances the flex below ↓
        buildMainCenterIcon(),
        buildQuoteButton(),
        buildScrollToSeeText(),
        Spacer(flex: 5), // pushes the content a bit higher
      ],
    );
  }

  Widget buildQuoteButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          updateQuote(); // if quote pressed then update the quote
        });
      },
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
      child: Text(
        currentQuote,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
        ),
      ),
    );
  }

  Widget buildMainCenterIcon() {
    return const Icon(Icons.paragliding_outlined, size: 50);
  }
}
