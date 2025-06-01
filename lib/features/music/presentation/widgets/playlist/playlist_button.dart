/*

PLAYLIST BUTTON
it will take a playlist and once the button is clicked
it will show the playlist

*/

// Imports
import 'package:flowscape/features/music/presentation/widgets/playlist/playlist.dart';
import 'package:flutter/material.dart';

// PlaylistButton
class PlaylistButton extends StatelessWidget {
  final Playlist playlist;

  const PlaylistButton({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToPlaylist(context),
      borderRadius: BorderRadius.circular(12),
      child: buildButton(context),
    );
  }

  void goToPlaylist(BuildContext context) {
    // Implement navigation or playlist opening logic here
  }

  Widget buildButton(context) {
    // Get the widget from buildHead
    return playlist.buildHeadImage(context);
  }
}
