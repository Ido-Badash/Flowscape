import 'package:flutter/material.dart';

class Scape extends StatelessWidget {
  final Text? creator;
  final Text? date;
  final Text? title;
  final Widget? headBody;
  final List<Widget> bodies;

  Scape({
    super.key,
    this.creator = const Text("No Creator Name"),
    this.date = const Text("No Date"),
    this.title = const Text("No Title"),
    this.headBody = const SizedBox(),
    this.bodies = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          buildDefaultNavigationContainer(context),
          Padding(
            padding: const EdgeInsets.only(top: 12.5),
            child: buildDefaultBodyContainer(context),
          ),
        ],
      ),
    ); // placeholder
  }

  Widget buildDefaultNavigationContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (3 / 4),
      height: MediaQuery.of(context).size.height  * (11 / 12),
      color: Colors.blueAccent,
    );
  }

  Widget buildDefaultBodyContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (11 / 12),
      height: MediaQuery.of(context).size.height * (13 / 15),
      color: Colors.green,
    );
  }
}
