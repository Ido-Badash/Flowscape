import 'package:flutter/material.dart';
import 'music_screen.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  Widget currentBody = MusicScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [],
        title: Text(
          "Music",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
          ),
        ),
        toolbarHeight: 45.0,
      ),
      body: currentBody,
    );
  }
}
