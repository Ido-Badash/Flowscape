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
  final void Function()? onTap;

  const Song({super.key, required this.song, this.style, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Cover image
              buildImage(context),

              // Space
              const SizedBox(width: 12.0),

              // Title and Artist in a Column
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle(context),
                    const SizedBox(height: 4),
                    buildArtist(context),
                  ],
                ),
              ),

              const SizedBox(width: 12.0),

              // Duration
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: buildDuration(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: style?.imageBg ?? Colors.indigo,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(song.coverImagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      song.title,
      style:
          style?.titleStyle ??
          Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget buildArtist(BuildContext context) {
    return Text(
      song.artist,
      style:
          style?.artistStyle ??
          Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget buildDuration(BuildContext context) {
    final minutes = song.currentSongTime.inMinutes;
    final seconds = (song.currentSongTime.inSeconds % 60).toString().padLeft(
      2,
      '0',
    );
    return Text(
      "$minutes:$seconds",
      style:
          style?.durationStyle ??
          Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade500),
    );
  }
}
