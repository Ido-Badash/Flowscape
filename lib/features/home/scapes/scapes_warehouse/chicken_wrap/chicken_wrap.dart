import 'package:flutter/material.dart';
import 'package:flowscape/features/home/scapes/scape_lib.dart';
import 'package:flowscape/core/helpers/helpers.dart';
import 'package:video_player/video_player.dart';

class ChickenWrapScape extends StatefulWidget {
  const ChickenWrapScape({super.key});

  @override
  State<ChickenWrapScape> createState() => _ChickenWrapScapeState();
}

class _ChickenWrapScapeState extends State<ChickenWrapScape> with ScapeUtils {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/scapes/chicken_wrap_recipe/chicken_wrap.mp4",
      )
      ..initialize().then((_) {
        setState(() {}); // Update the state once the video is initialized
      });
  }

  @override
  void dispose() {
    _controller?.dispose(); // Clean up the video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [buildHeadPage(), ...pageManager(buildPagesFunctionList())],
    );
  }

  // HEAD PAGE
  Widget buildHeadPage() {
    return ClassicHeadFrame(
      creator: "Noel Deyzel",
      date: "03/06/2025",
      textColor: Colors.white.withAlpha(75),
      child: buildHeadPageMainBody(),
    );
  }

  // HEAD PAGE MAIN BODY
  Widget buildHeadPageMainBody() {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Stack(alignment: AlignmentDirectional.center, children: [
          
        ],
      ),
    );
  }

  // PAGE MANAGER
  List<Widget Function()> buildPagesFunctionList() {
    return [buildPage1];
  }

  //* - BUILDING PAGES - *//
  // PAGE 1
  Widget buildPage1() {
    return AspectRatio(aspectRatio: _controller!.value.aspectRatio,
      child: VideoPlayer(_controller!),
    );
  }
}
