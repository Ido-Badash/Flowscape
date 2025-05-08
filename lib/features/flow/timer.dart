import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/flowbg_images.dart';

final List<String> bgImagesDark = getRandomDarkImages(5);
final List<String> bgImagesLight = getRandomLightImages(6);
int currentImage = 0;

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  List<String> get _bgImages => Theme.of(context).brightness == Brightness.dark
      ? bgImagesDark
      : bgImagesLight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheNextImage();
  }

  void _precacheNextImage() {
    final nextIndex = (currentImage + 1) % _bgImages.length;
    precacheImage(AssetImage(_bgImages[nextIndex]), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                currentImage = (currentImage + 1) % _bgImages.length;
                _precacheNextImage(); // precache the next image after changing
              });
            },
            child: SizedBox.expand(
              child: Image.asset(_bgImages[currentImage], fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}