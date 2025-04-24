import 'package:flutter/material.dart';

class Scape extends StatefulWidget {
  final String? autorName;
  final String? date;
  final String? title;
  final Widget headBody;
  final List<Widget> bodies;

  const Scape({
    super.key,
    this.autorName,
    this.date,
    this.title,
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
      body: Expanded(
        child: Column(
          children: [
            if (currentPageIdx == 0)
              Expanded(
                flex: 1,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.cyanAccent,
                    title: Text(
                      widget.autorName ?? "",
                      style: TextStyle(fontSize: 15),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          widget.date ?? "",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.indigo,
                child: Center(
                  child: Text(
                    widget.title ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
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
      ),
    );
  }
}
