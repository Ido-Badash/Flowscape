// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';

// SleepyPlaylist
class SleepyPlaylist extends PlaylistModel {
  SleepyPlaylist()
    : super(
        id: DateTime.now().millisecondsSinceEpoch,
        title: "Sleepy",
        creator: "FlowScape",
        description: "A playlist by FlowScape that contains music when your tired.",
        playlistImagePath: "assets/images/playlists/",
        songs: _buildSongs(),
      );

  static List<SongModel> _buildSongs() {
    return [];
  }
}
