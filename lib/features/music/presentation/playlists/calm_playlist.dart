// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';

// CalmPlaylist
class CalmPlaylist extends PlaylistModel {
  CalmPlaylist()
    : super(
        id: DateTime.now().millisecondsSinceEpoch,
        title: "Calm",
        creator: "FlowScape",
        description: "A playlist by FlowScape that contains calming music.",
        playlistImagePath: "assets/images/playlists/calm.jpg",
        songs: _buildSongs(),
      );

  static List<SongModel> _buildSongs() {
    return [
      SongModel(
        id: 0,
        title: "Elegant",
        artist: "Grand Project",
        audioFilePath: "assets/audio/calm/elegant.mp3",
      ),
    ];
  }
}
