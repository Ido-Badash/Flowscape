import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/quotes.dart';

// widgets
import 'widgets/scape.dart';

Widget page(Color color) {
  return Scaffold(backgroundColor: color);
}

final String firstQuote = randomQuote();
final Scape firstScape = Scape(
  autorBox: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.cyanAccent,
      title: const Text("Autor", style: TextStyle(fontSize: 15)),
      actions: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text("24/04/2025", style: TextStyle(fontSize: 15)),
        )
        ],),
  ),
  titleBox: Container(
    width: double.infinity,
    color: Colors.indigo,
    child: Center(
      child: Text(
      "Title",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
    ),
    ),
  headBody: page(Colors.deepOrange),
  bodies: [
    page(Colors.black),
    page(Colors.blue),
    page(Colors.red),
    page(Colors.green),
    page(Colors.yellow),
    page(Colors.orange),
    page(Colors.purple),
    page(Colors.brown),
    page(Colors.pink),
    page(Colors.cyan),
    page(Colors.teal),
    page(Colors.lime),
  ],
);

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
        currentItem = SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: buildTopScapesListViewItem(),
        );
      case 1:
        currentItem = SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: firstScape,
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
