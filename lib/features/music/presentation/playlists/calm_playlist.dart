/*

CALM PLAYLIST
a playlist by flowscape that contains calming music

*/

// imports
import 'package:flowscape/features/music/domains/domains_lib.dart';

// CalmPlaylist
class CalmPlaylist {
  // static playlist
  PlaylistModel build() {
    return PlaylistModel(
      id: 0,
      title: "Calm",
      creator: "FlowScape",
      description: "A playlist by FlowScape that contains calming music.",
      playlistImagePath: "assets/images/playlists/calm_playlist.png",
      songs: buildSongs(),
    );
  }

  List<SongModel> buildSongs() {
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
