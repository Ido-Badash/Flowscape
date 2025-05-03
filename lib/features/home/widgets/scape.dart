import 'package:flutter/material.dart';

import 'scape_style.dart';

ScapeStyle? scapeDefaultStyle;

class Scape extends StatefulWidget {
  final Text creator;
  final Text date;
  final Text title;
  final List<Widget> bodies;
  final ScapeStyle? style;

  const Scape({
    super.key,
    this.creator = const Text("No Creator Name"),
    this.date = const Text("No Date"),
    this.title = const Text("No Title"),
    this.bodies = const [],
    this.style,
  });

  @override
  State<Scape> createState() => _ScapeState();
}

class _ScapeState extends State<Scape> {
  final PageController _cardsPageController = PageController();

  @override
  Widget build(BuildContext context) {
    scapeDefaultStyle = ScapeStyle(
      background: Theme.of(context).colorScheme.primaryContainer,
    );
    return buildScapeStack();
  }

  Widget buildScapeStack() {
    return Expanded(
      child: Container(
        color: widget.style?.background ?? scapeDefaultStyle?.background,
        child: Column(children: [buildScaoes(), buildNavigationCircles()]),
      ),
    );
  }

  Widget buildScaoes() {
    return Flexible(
      flex: 9,
      child: PageView.builder(
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _cardsPageController,
        itemBuilder: cardsPageItemBuilder,
        itemCount: widget.bodies.length,
      ),
    );
  }

  Widget? cardsPageItemBuilder(BuildContext context, int index) {
    return widget.bodies[index];
  }

  Widget buildHeadCard() {
    return Container(color: Colors.amber);
  }

  Widget buildNavigationCircles() {
    return Flexible(flex: 1, child: SizedBox());
  }
}
