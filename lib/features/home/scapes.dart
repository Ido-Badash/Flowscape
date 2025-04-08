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
  String currentQuote = firstQuote;

  void updateQuote() {
    currentQuote = randomQuote();
  }

  @override
  Widget build(BuildContext context) {
    List scapesListViewItems = buildScapesListViewItems();

    return Scaffold(
      body: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return scapesListViewItems[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 200,
              thickness: 0,
              color: Colors.transparent,
            );
          },
          itemCount: scapesListViewItems.length,
        ),
      ),
    );
  }

  List buildScapesListViewItems() {
    return [
      const Spacer(),
      buildTopScapesListViewItem(),
      const Spacer(),
      const Text("Scape 1", textAlign: TextAlign.center),
      const Text("Scape 2", textAlign: TextAlign.center),
      const Text("Scape 3", textAlign: TextAlign.center),
      const Text("Scape 4", textAlign: TextAlign.center),
      const Text("Scape 5", textAlign: TextAlign.center),
      const Spacer(),
      buildBackToTopButton(),
    ];
  }

  Center buildScrollToSeeText() {
    return const Center(
      child: Text(
        "Scroll to see Scapes",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
      ),
    );
  }

  buildBackToTopButton() {
    return null;
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
