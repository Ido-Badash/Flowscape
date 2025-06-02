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
  final void Function(BuildContext context) onTap;

  const PlaylistButton({
    super.key,
    required this.playlist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }

  Widget buildButton(context) {
    // Get the widget from buildHead
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: InkWell(
            onTap: () => onTap(context),
            borderRadius: BorderRadius.circular(12),
            child: playlist.buildHeadImage(context),
          ),
        ),
        Flexible(child: playlist.buildHeadText(context)),
      ],
    );
  }
}
