import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/quotes.dart';

// widgets
import 'widgets/scape.dart';

Widget page(Color color) {
  return Container(color: color);
}

final String firstQuote = randomQuote();
final Scape firstScape = Scape();
final List scapes = [firstScape];

class ScapesScreen extends StatefulWidget {
  const ScapesScreen({super.key});

  @override
  State<ScapesScreen> createState() => _ScapesScreenState();
}

class _ScapesScreenState extends State<ScapesScreen> {
  final ScrollController listViewController = ScrollController();
  String currentQuote = firstQuote;

  void updateQuote() {
    currentQuote = randomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildBackToTopButton(),
      body: Column(
        // Replace Expanded with Column
        children: [
          Expanded(
            child: ListView.builder(
              controller: listViewController,
              itemBuilder: listViewItemBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Widget? listViewItemBuilder(BuildContext context, int index) {
    Widget? currentItem;
    switch (index) {
      case 0:
        currentItem = buildTopScapesListViewItem();
      case 1:
        currentItem = scapes[index - 1];
      default:
      //* use this text setuo for Scape class title params later
        currentItem = Text(
          index.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
          );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 24, left: 24),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
          child: currentItem,
        ),
      ),
    );
  }

  void scapesListViewScrollUp() {
    listViewController.jumpTo(0.0); // goes up in the list view
  }

  Center buildScrollToSeeText() {
    return const Center(
      child: Text(
        "Scroll to see Scapes",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
      ),
    );
  }

  Column buildBackToTopButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Tooltip(
          message: "Back to top",
          preferBelow: false,
          child: FloatingActionButton(
            onPressed: scapesListViewScrollUp,
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
  Column buildTopScapesListViewItem() {
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

  TextButton buildQuoteButton() {
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

  Icon buildMainCenterIcon() {
    return const Icon(Icons.paragliding_outlined, size: 50);
  }
}
