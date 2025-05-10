import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'scape_style.dart';

ScapeStyle? scapeDefaultStyle;

/// A StatefulWidget that uses PageView and the smooth_page_indicator
/// to make a beautiful card with custom style and detail params
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
    this.date = const Text("Unknown Date", style: TextStyle(fontSize: 14)),
    this.title = const Text("No Title", style: TextStyle(fontSize: 20)),
    required this.bodies,
    this.style,
  });

  @override
  State<Scape> createState() => _ScapeState();
}

class _ScapeState extends State<Scape> {
  final PageController _controller = PageController();
  List<Widget> updatedBodies = const [];

  @override
  void dispose() {
    _controller.dispose(); // cleans up the controller for logic reset
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updatedBodies =
        widget.bodies.isNotEmpty
            ? [buildHeadCard(), ...widget.bodies.sublist(1)]
            : [buildHeadCard()];
    scapeDefaultStyle = ScapeStyle(
      background: Theme.of(context).colorScheme.surface,
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
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PageView.builder(
              physics: const PageScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              controller: _controller,
              itemBuilder: _itemBuilder,
              itemCount: widget.bodies.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget? _itemBuilder(BuildContext context, int index) {
    return updatedBodies[index];
  }

  Widget buildHeadCard() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        widget.bodies.isNotEmpty
            ? widget.bodies[0]
            : Container(color: Colors.red),
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
          effect: WormEffect(
            dotColor: widget.style?.offPage ?? Colors.grey,
            activeDotColor: widget.style?.onPage ?? Colors.indigo,
          ),
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

  String getScapeData() {
    return "title: ${widget.title.data}, creator: ${widget.creator.data}, data: ${widget.date.data}";
  }
}
