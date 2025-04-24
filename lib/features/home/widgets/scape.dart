import 'package:flutter/material.dart';

class Scape extends StatefulWidget {
  final Widget? autorBox;
  final Widget? titleBox;
  final Widget headBody;
  final List<Widget> bodies;

  const Scape({
    super.key,
    this.autorBox,
    this.titleBox,
    required this.headBody,
    required this.bodies,
  });

  @override
  State<Scape> createState() => _ScapeState();
}

class _ScapeState extends State<Scape> {
  final PageController _controller = PageController();
  int currentPageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (currentPageIdx == 0)
            Expanded(flex: 1, child: widget.autorBox ?? Container()),
            Expanded(flex: 1, child: widget.titleBox ?? Container()),
          Expanded(
            flex: 8,
            child: PageView(
              controller: _controller,
              children: [widget.headBody, ...widget.bodies],
            ),
          ),
          Expanded(flex: 1, child: Container(color: Colors.indigo)),
        ],
      ),
    );
  }
}
