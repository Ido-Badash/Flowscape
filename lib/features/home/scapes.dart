import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/quotes.dart';

final String firstQuote = randomQuote();

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
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          controller: listViewController,
          itemBuilder: listViewItemBuilder,
        ),
      ),
    );
  }

  Widget? listViewItemBuilder(BuildContext context, int index) {
    Widget? currentItem;
    switch (index) {
      case 0:
        final double topNBottomPad = MediaQuery.of(context).size.height * 0.325;
        currentItem = Padding(
          padding: EdgeInsets.only(top: topNBottomPad, bottom: topNBottomPad),
          child: buildTopScapesListViewItem(),
        );
      default:
        currentItem = Text(index.toString());
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: currentItem),
    );
  }

  void scapesListViewScrollUp() {
    final double start = 0.0;
    listViewController.jumpTo(start);
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
        FloatingActionButton(
          tooltip: "Back to top", // make in top later
          onPressed: scapesListViewScrollUp,
          mini: true, // makes the button small
          shape: CircleBorder(),
          child: Icon(
            Icons.arrow_upward_rounded),
        ),
      ],
    );
  }

  /// The build for the top quote area
  Column buildTopScapesListViewItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMainCenterIcon(),
        buildQuoteButton(),
        buildScrollToSeeText(),
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
