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
    this.creator = const Text("Unknown Creator", style: TextStyle(fontSize: 16)),
    this.date = const Text("No Date", style: TextStyle(fontSize: 16)),
    this.title = const Text("No Title", style: TextStyle(fontSize: 16)),
    this.bodies = const [],
    this.style,
  });

  @override
  State<Scape> createState() => _ScapeState();
}

class _ScapeState extends State<Scape> {
  final PageController _cardsPageController = PageController();
  List<Widget> updatedBodies = const [];

  @override
  Widget build(BuildContext context) {
    updatedBodies = [buildHeadCard(), ...widget.bodies.sublist(1)];
    scapeDefaultStyle = ScapeStyle(
      background: Theme.of(context).colorScheme.primaryContainer,
    );
    return buildScapeStack();
  }

  Widget buildScapeStack() {
    return Container(
      color: widget.style?.background ?? scapeDefaultStyle?.background,
      child: Column(children: [buildCards(), buildNavigationCircles()]),
    );
  }

  Widget buildCards() {
    return Flexible(
      flex: 9,
      child: Container(
        color: widget.style?.background ?? scapeDefaultStyle?.background,
        child: PageView.builder(
          physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
          controller: _cardsPageController,
          itemBuilder: cardsPageItemBuilder,
          itemCount: widget.bodies.length,
        ),
      ),
    );
  }

  Widget? cardsPageItemBuilder(BuildContext context, int index) {
    return updatedBodies[index];
  }

  Widget buildHeadCard() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        widget.bodies[0],
        widget.title,
        Positioned(bottom: 0, left: 5, child: widget.creator),
        Positioned(bottom: 0, right: 5, child: widget.date),
      ],
    );
  }

  Widget buildNavigationCircles() {
    return Flexible(flex: 1, child: Container(color: Colors.indigoAccent));
  }
}
