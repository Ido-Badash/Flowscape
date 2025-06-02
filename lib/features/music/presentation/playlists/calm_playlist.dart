// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';
import 'package:flutter/material.dart';

// CalmPlaylist
class CalmPlaylist extends PlaylistModel {
  CalmPlaylist()
    : super(
        id: DateTime.now().millisecondsSinceEpoch,
        title: "Calm",
        creator: "FlowScape",
        description: "A playlist by FlowScape that contains calming music.",
        playlistImagePath: "assets/images/flowbgs_dark/flowbg_2.jpg",
        songs: _buildSongs(),
      );

  static List<SongModel> _buildSongs() {
    final SongModel song1 = SongModel(
      id: 0,
      title: "Elegant",
      artist: "Grand Project",
      audioFilePath: "assets/audio/calm/elegant.mp3",
      coverImagePath: "assets/images/flowbgs_dark/flowbg_1.jpg",
    );
    debugPrint("CalmPlaylist: ${song1.title} by ${song1.artist} with image: ${song1.coverImagePath}");
    return [song1];
  }
}
