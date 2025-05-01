import 'package:flutter/material.dart';

class Scape extends StatelessWidget {
  final Text? creator;
  final Text? date;
  final Text? title;
  final Widget? headBody;
  final List<Widget> bodies;

  const Scape({
    super.key,
    this.creator = const Text("No Creator Name"),
    this.date = const Text("No Date"),
    this.title = const Text("No Title"),
    this.headBody = const SizedBox(),
    this.bodies = const [],
  });

  @override
  Widget build(BuildContext context) {
    return buildScapeStack();
  }

  Widget buildScapeStack() {
    return Stack(
      children: [
        
      ],
    );
  }
}
