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
    return Column(
      children: [
        Flexible(flex: 1, child: buildHead(context)),
        Flexible(flex: 4, child: buildSongs(context)),
      ],
    );
  }

  //* --- HEAD ---
  Widget buildHead(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 1, child: buildHeadImage(context)),
        Flexible(flex: 3, child: buildHeadText(context)),
      ],
    );
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
      children: [
        Flexible(
          flex: 5,
          child: Text(
            playlist.title,
            style: style?.titleStyle ?? _defaultTX(context),
          ),
        ),
        Flexible(
          flex: 4,
          child: Text(
            playlist.creator,
            style: style?.creatorStyle ?? _defaultTX(context),
          ),
        ),
      ],
    );
  }

  //* --- SONGS ---
  Widget buildSongs(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Row(
            spacing: 20.0,
            children: [Text("Title"), Text("Album"), Text("Duration")],
          ),
        ),
        Flexible(flex: 4, child: Column(children: addIdxToSongs())),
      ],
    );
  }

  List<Widget> addIdxToSongs() {
    final songs = fetchSongs();
    return List<Widget>.generate(
      songs.length,
      (index) => Row(
        children: [
          Flexible(flex: 1, child: Text('${index + 1}')),
          Spacer(flex: 1),
          Flexible(flex: 9, child: songs[index]),
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
