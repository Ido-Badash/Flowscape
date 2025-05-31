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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [buildHead(context), buildSongs(context)],
      ),
    );
  }

  //* --- HEAD ---
  Widget buildHead(BuildContext context) {
    return Row(children: [buildHeadImage(context), buildHeadText(context)]);
  }

  Widget buildHeadImage(BuildContext context) {
    return Container(
      color: style?.imageBg ?? Colors.indigo,
      child:
          playlist.playlistImagePath != null
              ? Image.asset(playlist.playlistImagePath!)
              : () {
                debugPrint(
                  "Cover Image provided in Playlist widget was not found in assets",
                );
                return SizedBox.shrink();
              }(),
    );
  }

  Widget buildHeadText(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Add this line!
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(playlist.title, style: style?.titleStyle ?? _defaultTX(context)),
        Text(
          playlist.creator,
          style: style?.creatorStyle ?? _defaultTX(context),
        ),
      ],
    );
  }

  //* --- SONGS ---
  Widget buildSongs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Text("Title"), Text("Album"), Text("Duration")]),
        ...addIdxToSongs(),
      ],
    );
  }

  List<Widget> addIdxToSongs() {
    final songs = fetchSongs();
    return List<Widget>.generate(
      songs.length,
      (index) => Row(
        children: [
          Text('${index + 1}'),
          SizedBox(width: 8),
          songs[index], // Only if Row is in a bounded context
        ],
      ),
    );
  }

  List<Song> fetchSongs() {
    playlist.init();
    return playlist.songs
        .map(
          (song) => Song(
            song: song,
            style: songsStyle?[playlist.songs.indexOf(song)],
          ),
        )
        .toList();
  }

  // _defaultTX -> default Text style
  TextStyle _defaultTX(BuildContext context) {
    return TextStyle();
  }
}
