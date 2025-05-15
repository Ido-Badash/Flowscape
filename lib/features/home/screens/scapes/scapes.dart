import 'package:flutter/material.dart';
import 'scapes_warehouse/scapes_warehouse.dart';

// data
import 'package:flowscape/core/data/quotes.dart';

final String firstQuote = randomQuote();

class ScapesScreen extends StatefulWidget {
  const ScapesScreen({super.key});

  @override
  State<ScapesScreen> createState() => _ScapesScreenState();
}

class _ScapesScreenState extends State<ScapesScreen> {
  final PageController _scapesPageController = PageController();
  String currentQuote = firstQuote;

  @override
  void dispose() {
    _scapesPageController.dispose(); // cleans up the controller for logic reset
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildBackToTopButton(),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _scapesPageController,
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
    _scapesPageController.jumpTo(0.0); // goes to the top in the page view
  }

  List<Widget> buildScapes() {
    return [ManageYourTimeScape()];
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
            child: const Opacity(
              opacity: 0.1,
              child: Icon(Icons.arrow_upward_rounded),
            ),
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

  void updateQuote() {
    currentQuote = randomQuote();
  }
}
