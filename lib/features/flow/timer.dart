import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/flowbg_images.dart';

final List<String> bgImages = getRandomImagesList(11);
int currentImage = 0;

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(bgImages[currentImage], fit: BoxFit.cover),
          ),
          Positioned(bottom: 0, left: 0, child: buildNextImageIconButton()),
        ],
      ),
    );
  }

  Widget buildNextImageIconButton() {
    return IconButton(
      onPressed: () {
        // Add your button action here
        setState(() {
          currentImage = (currentImage + 1) % bgImages.length;
          debugPrint(currentImage.toString());
        });
      },
      iconSize: 30,
      icon: Icon(color: Theme.of(context).colorScheme.onSurface,  Icons.next_plan_outlined),
    );
  }
}
