import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/quotes.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

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
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: FlowTextsSizes.h8,
                  color: FlowColors.lavender,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
