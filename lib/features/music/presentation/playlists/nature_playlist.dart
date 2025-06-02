// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';

// NaturePlaylist
class NaturePlaylist extends PlaylistModel {
  NaturePlaylist()
    : super(
        id: DateTime.now().millisecondsSinceEpoch,
        title: "Nature",
        creator: "FlowScape",
        description: "A playlist by FlowScape that contains nature type music.",
        playlistImagePath: "assets/images/flowbgs_dark/flowbg_4.jpg",
        songs: _buildSongs(),
      );

  static List<SongModel> _buildSongs() {
    return [];
  }
}
