import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/flowbg_images.dart';

// styles
import 'package:flowscape/core/styles/colors.dart';

final List<String> bgImages = getRandomImagesList(12);

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowColors.body,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(bgImages[currentImage], fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: buildNextImageIconButton(),
          ),
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
      icon: Icon(color: FlowColors.text3, Icons.next_plan_outlined),
    );
  }
}
