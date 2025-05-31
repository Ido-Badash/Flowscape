/*
  PLAYLIST WIDGET
  Take a PlaylistModel and turn it to a widget
*/

// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';
import 'package:flowscape/features/music/presentation/widgets/playlist/playlist_style.dart';
import 'package:flowscape/features/music/presentation/widgets/widgets_lib.dart';
import 'package:flutter/material.dart';

// Playlist
class Playlist extends StatelessWidget {
  final PlaylistModel playlist;
  final PlaylistStyle? style;
  final List<SongStyle>? songsStyle;

  const Playlist({
    super.key,
    required this.playlist,
    this.style,
    this.songsStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHead(context),
          const SizedBox(height: 24),
          buildSongsHeader(context),
          const SizedBox(height: 8),
          ...addIdxToSongs(),
        ],
      ),
    );
  }

  //* --- HEAD ---
  Widget buildHead(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeadImage(context),
        const SizedBox(width: 16),
        Expanded(child: buildHeadText(context)),
      ],
    );
  }

  Widget buildHeadImage(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: style?.imageBg ?? Colors.indigo,
      ),
      child:
          playlist.playlistImagePath != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  playlist.playlistImagePath!,
                  fit: BoxFit.cover,
                ),
              )
              : const Icon(Icons.music_note, color: Colors.white),
    );
  }

  Widget buildHeadText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          playlist.title,
          style:
              style?.titleStyle ??
              Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          playlist.creator,
          style:
              style?.creatorStyle ??
              Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  //* --- SONGS HEADER ---
  Widget buildSongsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: const [
          SizedBox(width: 24, child: Text("#")),
          SizedBox(width: 12),
          Expanded(flex: 2, child: Text("Song")),
          Expanded(child: Text("Duration", textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  //* --- SONGS ---
  List<Widget> addIdxToSongs() {
    final songs = fetchSongs();
    return List<Widget>.generate(
      songs.length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 12,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(flex: 2, child: songs[index]),
          ],
        ),
      ),
    );
  }

  List<Song> fetchSongs() {
    return playlist.songs
        .asMap()
        .entries
        .map(
          (entry) => Song(
            song: entry.value,
            style:
                songsStyle != null && songsStyle!.length > entry.key
                    ? songsStyle![entry.key]
                    : null,
          ),
        )
        .toList();
  }
}
