// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';

// FocusPlaylist
class FocusPlaylist extends PlaylistModel {
  FocusPlaylist()
    : super(
        id: DateTime.now().millisecondsSinceEpoch,
        title: "Focus",
        creator: "FlowScape",
        description: "A playlist by FlowScape that contains music for you to.",
        playlistImagePath: "assets/images/flowbgs_dark/flowbg_3.jpg",
        songs: _buildSongs(),
      );

  static List<SongModel> _buildSongs() {
    return [];
  }
}
