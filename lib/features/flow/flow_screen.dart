import 'package:flutter/material.dart';

// data
import 'package:flowscape/core/data/flowbg_images.dart';

final List<String> bgImagesDark = getRandomDarkImages(10);
final List<String> bgImagesLight = getRandomLightImages(10);
int currentImageIdx = 0;

class FlowScreen extends StatefulWidget {
  final Widget child;

  const FlowScreen({super.key, this.child = const SizedBox.shrink()});

  @override
  State<FlowScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<FlowScreen> {
  List<String> get _bgImages =>
      Theme.of(context).brightness == Brightness.dark
          ? bgImagesDark
          : bgImagesLight;

  int get _nextImageIdx => (currentImageIdx + 1) % _bgImages.length;
  String get _nextImage => _bgImages[_nextImageIdx];

  @override
  void didChangeDependencies() {
    _precacheNextImage();
    super.didChangeDependencies();
  }

  void _precacheNextImage() {
    precacheImage(AssetImage(_nextImage), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                currentImageIdx = _nextImageIdx;
                _precacheNextImage();
              });
            },
            child: SizedBox.expand(
              child: Image.asset(_bgImages[currentImageIdx], fit: BoxFit.cover),
            ),
          ),
          widget.child,
          // TODO: load this child only after the image is loaded
        ],
      ),
    );
  }
}
