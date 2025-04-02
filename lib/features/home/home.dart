import 'package:flowscape/core/data/quotes.dart';
import 'package:flutter/material.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';
import 'package:flowscape/core/styles/texts_sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentQuote = randomQuote();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 1.5,
      children: [ 
        Text(
          currentQuote,
          style: const TextStyle(
            fontSize: FlowTextsSizes.h3,
            color: FlowColors.lavender,
          ),
        ),
      ],
    );
  }

  void updateQuote() {
    currentQuote = randomQuote();
  }
}
