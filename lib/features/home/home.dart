import 'package:flowscape/core/data/quotes.dart';
import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

final String firstQuote = randomQuote();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentQuote = firstQuote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.paragliding_outlined,
              size: 50,
              color: FlowColors.lavender,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  updateQuote();
                });
              },
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                currentQuote,
                style: const TextStyle(
                  fontSize: FlowTextsSizes.h3,
                  color: FlowColors.lavender,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateQuote() {
    currentQuote = randomQuote();
  }
}
