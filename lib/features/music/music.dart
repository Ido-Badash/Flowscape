import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [],
        title: Text(
          "Music",
          style: TextStyle(fontSize: Theme.of(context).textTheme.displaySmall?.fontSize),
        ),
        toolbarHeight: 45.0,
      ),
      body: Center(
        child: Text("Music"),
      ),
    );
  }
}
