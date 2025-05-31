/*

SONG WIDGET
Take a SongModel and turn it to a widget

*/

// imports
import 'package:flowscape/features/music/presentation/widgets/song/song_style.dart';
import 'package:flutter/material.dart';
import 'package:flowscape/features/music/domains/song/model/song_model.dart';

// Song
class Song extends StatelessWidget {
  final SongModel song;
  final SongStyle? style;

  const Song({super.key, required this.song, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        spacing: 8.0,
        children: [
          buildImage(context),
          buildTitle(context),
          buildArtist(context),
          buildDuration(context),
        ],
      ),
    );
  }

  // buildImage
  Widget buildImage(BuildContext context) {
    return Container(color: style?.imageBg ?? Colors.indigo);
  }

  // buildTitle
  Widget buildTitle(BuildContext context) {
    return Text(song.title, style: style?.titleStyle ?? _defaultTX(context));
  }

  // buildArtist
  Widget buildArtist(BuildContext context) {
    return Text(song.artist, style: style?.artistStyle ?? _defaultTX(context));
  }

  // buildDuration
  Widget buildDuration(BuildContext context) {
    return Text(
      "${song.currentSongTime.inMinutes}:${(song.currentSongTime.inSeconds % 60).toString().padLeft(2, '0')}",
      style: style?.durationStyle ?? _defaultTX(context),
    );
  }

  // _defaultTX -> default Text style
  TextStyle _defaultTX(BuildContext context) {
    return TextStyle();
  }
}
