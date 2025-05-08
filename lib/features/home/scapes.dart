
import 'dart:math';

import 'package:flowscape/features/home/widgets/scape_style.dart';
import 'package:flutter/material.dart';

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
        itemCount: [buildTopScapesPageViewItem(), ...buildScapes()].length,
      ),
    );
  }

  Widget pageViewItemBuilder(BuildContext context, int index) {
    Widget currentItem;
    List pageWidgets = [buildTopScapesPageViewItem(), ...buildScapes()];

    if (index >= 0 && index < pageWidgets.length) {
      currentItem = pageWidgets[index];
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

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(child: currentItem),
    );
  }

  void scapesPageViewScrollUp() {
    scapesPageController.jumpTo(0.0); // goes up in the list view
  }

  List<Widget> buildScapes() {
    final random = Random();
    List colors = [
      Colors.amber,
      Colors.blueAccent,
      Colors.indigoAccent,
      Colors.cyanAccent,
      Colors.brown,
      Colors.deepOrange,
      Colors.deepPurpleAccent,
      Colors.green,
      Colors.lime,
      Colors.pink,
      Colors.teal,
      Colors.grey
    ];

    return List.generate(10, (int idx) {
      return Scape(
        creator: Text(
          "Ido Badash",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        date: Text(
          "08/05/2025",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        title: Text(
          "Title",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        bodies: List.generate(random.nextInt(7) + 1, (int idx) {
          return page(colors[random.nextInt(colors.length)]);
        }),
        style: ScapeStyle(offPage: Colors.white.withValues(alpha: 0.35)),
      );
    });
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
