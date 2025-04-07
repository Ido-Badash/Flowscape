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
  @override
  Widget build(BuildContext context) {
    List<String> bgImages =
        Theme.of(context).brightness == Brightness.dark
            ? bgImagesDark
            : bgImagesLight;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                currentImage = (currentImage + 1) % bgImages.length;
                debugPrint(currentImage.toString());
              });
            },
            child: SizedBox.expand(
              child: Image.asset(bgImages[currentImage], fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
