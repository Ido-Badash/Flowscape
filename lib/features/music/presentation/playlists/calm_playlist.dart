// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';

// CalmPlaylist
class CalmPlaylist extends PlaylistModel {
  final String? coverImagePath;

  CalmPlaylist({this.coverImagePath})
    : super(
        id: DateTime.now().millisecondsSinceEpoch,
        title: "Calm",
        creator: "FlowScape",
        description: "A playlist by FlowScape that contains calming music.",
        playlistImagePath: coverImagePath ?? "assets/images/playlists/calm.png",
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
