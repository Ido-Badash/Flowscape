import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongControls extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const SongControls({super.key, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;

        if (!(playing ?? false)) {
          return buildPlayButton();
        } else if (processingState == ProcessingState.completed) {
          return buildPauseButton();
        }
        return const Icon(
          Icons.play_arrow_rounded,
          size: 80,
          color: Colors.white,
        );
      },
    );
  }

  Widget buildPlayButton() {
    return IconButton(
      onPressed: audioPlayer.play,
      iconSize: 80,
      color: Colors.white,
      icon: const Icon(Icons.play_arrow_rounded),
    );
  }

  Widget buildPauseButton() {
    return IconButton(
      onPressed: audioPlayer.pause,
      iconSize: 80,
      color: Colors.white,
      icon: const Icon(Icons.pause_rounded),
    );
  }
}
