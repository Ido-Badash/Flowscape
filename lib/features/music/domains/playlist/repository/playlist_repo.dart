/*

PLAYLIST REPO
pure dart code

Here is an abstracted class that defines the operations
the app can do with the playlist.

--------------------------------------------------------
~~~ METHODS ~~~
* - getAllPlaylists()
    returns a list of all playlists in the database
    
* - addSong()
    adds a song to a playlist
    params:
      SongModel songModel,
      int playlistId

* - updateSong()
    updates a song in the playlist
    params:
      SongModel songModel,
      int playlistId

* - deleteSong()
    deletes a song from the playlist
    params:
      SongModel songModel,
      int playlistId

--------------------------------------------------------
~~~ NOTES ~~~
- all of the method are Future<void>
  exept the getAllPlaylists() method
  that is Future<List<Song>>

*/

// Imports
import 'package:flowscape/features/music/domains/playlist/models/models_lib.dart';
import 'package:flowscape/features/music/domains/song/model/song_model.dart';

// PlaylistRepo
abstract class PlaylistRepo {
  /// gets all playlists
  Future<List<PlaylistModel>> getAllPlaylists();

  /// adds a song to a playlist
  Future<void> addSong(SongModel songModel, int playlistId);

  /// updates a song in the playlist
  Future<void> updateSong(SongModel songModel, int playlistId);

  /// deletes a song from the playlist
  Future<void> deleteSong(SongModel songModel, int playlistId);
}