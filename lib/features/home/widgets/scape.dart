import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    this.creator = const Text(
      "Unknown Creator",
      style: TextStyle(fontSize: 14),
    ),
    this.date = const Text("No Date", style: TextStyle(fontSize: 14)),
    this.title = const Text("No Title", style: TextStyle(fontSize: 20)),
    this.bodies = const [],
    this.style,
  });

  @override
  State<Scape> createState() => _ScapeState();
}

class _ScapeState extends State<Scape> {
  final PageController _controller = PageController();
  List<Widget> updatedBodies = const [];

  @override
  Widget build(BuildContext context) {
    updatedBodies = [buildHeadCard(), ...widget.bodies.sublist(1)];
    scapeDefaultStyle = ScapeStyle(
      background: Theme.of(context).colorScheme.primaryContainer,
    );
    return buildScapeStack(context);
  }

  Widget buildScapeStack(BuildContext context) {
    return Container(
      color: scapeStyleBgColorLogic(),
      child: Column(children: [buildCards(), buildPageIndicator(context)]),
    );
  }

  Widget buildCards() {
    return Flexible(
      flex: 9,
      child: Container(
        color: scapeStyleBgColorLogic(),
        child: PageView.builder(
          physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
          controller: _controller,
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
        Positioned(top: 5, child: widget.title),
        Positioned(bottom: 0, left: 10, child: widget.creator),
        Positioned(bottom: 0, right: 10, child: widget.date),
      ],
    );
  }

  Widget buildPageIndicator(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        child: SmoothPageIndicator(
          controller: _controller,
          count: widget.bodies.length,
          effect: WormEffect(),
          onDotClicked: (int idx) {
            _controller.animateToPage(
              idx,
              duration: Durations.long4,
              curve: Curves.easeInOutCubicEmphasized,
            );
          },
        ),
      ),
    );
  }

  // the logic of the bg color picked in the style param, return a red color when there is an error
  Color scapeStyleBgColorLogic() {
    return (widget.style?.background ?? scapeDefaultStyle?.background) ??
        Colors.red;
  }
}
