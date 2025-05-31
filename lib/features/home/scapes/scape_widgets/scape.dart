import 'package:flowscape/features/home/scapes/scape_lib.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

ScapeStyle? scapeDefaultStyle;

/// A StatefulWidget that uses PageView and the smooth_page_indicator
/// to make a beautiful card with custom style and detail params
class Scape extends StatefulWidget {
  final List<Widget> children;
  final ScapeStyle? style;
  final bool ignored;
  final bool removePageIndicator;

  const Scape({
    super.key,
    this.children = const [],
    this.style,
    this.ignored = false,
    this.removePageIndicator = false,
  });

  @override
  State<Scape> createState() => _ScapeState();
}

class _ScapeState extends State<Scape> {
  final PageController _controller = PageController();
  List<Widget> updatedChildren = const [];

  @override
  void dispose() {
    _controller.dispose(); // cleans up the controller for logic reset
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updatedChildren =
        widget.children.isNotEmpty
            ? [...widget.children]
            : [buildDefaultHeadCard()];
    scapeDefaultStyle = ScapeStyle(
      background: Theme.of(context).colorScheme.surface,
    );
    return AbsorbPointer(
      absorbing: widget.ignored,
      child: buildScapeStack(context),
    );
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
          itemBuilder: _itemBuilder,
          itemCount: updatedChildren.length,
        ),
      ),
    );
  }

  Widget? _itemBuilder(BuildContext context, int index) {
    return Container(child: updatedChildren[index]);
  }

  Widget buildDefaultHeadCard() {
    return Container(color: Colors.indigo, child: ClassicHeadFrame());
  }

  Widget buildPageIndicator(BuildContext context) {
    return !widget.removePageIndicator
        ? Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: _controller,
              count: updatedChildren.length,
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
        )
        : const SizedBox.shrink();
  }

  // the logic of the bg color picked in the style param, return a red color when there is an error
  Color scapeStyleBgColorLogic() {
    return (widget.style?.background ?? scapeDefaultStyle?.background) ??
        Colors.red;
  }
}
