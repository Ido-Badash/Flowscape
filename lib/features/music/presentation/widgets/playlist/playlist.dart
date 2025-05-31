/*

PLAYLIST WIDGET
Take a PlaylistModel and turn it to a widget

*/

// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';
import 'package:flowscape/features/music/presentation/widgets/playlist/playlist_style.dart';
import 'package:flutter/material.dart';

// Playlist
class Playlist extends StatelessWidget {
  final PlaylistModel playlist;
  final PlaylistStyle? style;

  const Playlist({super.key, required this.playlist, this.style});

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
    return Container();
  }

  Widget buildHeadText(BuildContext context) {
    return Container();
  }

  //* --- SONGS ---
  Widget buildSongs(BuildContext context) {
    return Container();
  }
}
