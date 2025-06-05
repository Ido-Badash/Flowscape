import 'dart:async';
import 'package:flutter/cupertino.dart';
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
  double _buttonOpacity = 1.0;
  Timer? _fadeTimer;
  Duration _lastPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.asset(
        "assets/videos/scapes/chicken_wrap_recipe/chicken_wrap.mp4",
      )
      ..initialize().then((_) {
        if (_lastPosition > Duration.zero) {
          _controller!.seekTo(_lastPosition);
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    _lastPosition = _controller?.value.position ?? Duration.zero;
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scape(
      children: [
        buildHeadPage(context),
        ...pageManager(buildPagesFunctionList()),
      ],
    );
  }

  // HEAD PAGE
  Widget buildHeadPage(BuildContext context) {
    return ClassicHeadFrame(
      creator: "Noel Deyzel",
      title: "Chicken Wrap Recipe",
      date: "03/06/2025",
      textColor: Theme.of(context).colorScheme.onSecondary,
      titleUnderline: false,
      child: buildHeadPageMainBody(),
    );
  }

  // HEAD PAGE MAIN BODY
  Widget buildHeadPageMainBody() {
    return GeneralWidgetUtils.buildAClipRRPage(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.redAccent, Colors.red, Colors.black],
              ),
            ),
            child: const Center(
              child: Icon(CupertinoIcons.flame, size: 100, color: Colors.white),
            ),
          ),
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
  void _showButtonTemporarily() {
    setState(() => _buttonOpacity = 1.0);
    _fadeTimer?.cancel();
    _fadeTimer = Timer(const Duration(seconds: 2), () {
      setState(() => _buttonOpacity = 0.0);
    });
  }

  Widget buildPage1() {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    final videoWidth = MediaQuery.of(context).size.width * 0.9;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller!.value.isPlaying) {
            _controller!.pause();
          } else {
            _controller!.play();
          }
        });
        _showButtonTemporarily();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: videoWidth,
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
          ),
          AnimatedOpacity(
            opacity: _buttonOpacity,
            duration: const Duration(milliseconds: 400),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              radius: 30,
              child: Icon(
                _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
