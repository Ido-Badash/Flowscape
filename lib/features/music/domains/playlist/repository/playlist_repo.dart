/*

PLAYLIST REPO
pure dart code

Here is an abstracted class that defines the operations
the app can do with the playlist.

--------------------------------------------------------
~~~ METHODS ~~~
* - getAllPlaylists()
    returns a list of all playlists in the database

* - getPlaylist(int playlistId)
    returns a playlist from the database
    
* - addPlaylist(PlaylistModel playlist)
    adds a new playlist to the database

* - updatePlaylist(PlaylistModel playlist)
    updates an existing playlist in the database

* - removePlaylist(int playlistId)
    removes a playlist from the database

* - addSong(SongModel songModel, int playlistId)
    adds a song to a playlist

* - updateSong(SongModel songModel, int playlistId)
    updates a song in the playlist

* - deleteSong(SongModel songModel, int playlistId)
    deletes a song from the playlist

--------------------------------------------------------
~~~ NOTES ~~~
- all of the method are Future<void>
  except the getAllPlaylists() method
  that is Future<List<Song>>

*/

// Imports
import 'package:flowscape/features/music/domains/playlist/models/playlist_model.dart';
import 'package:flowscape/features/music/domains/song/model/song_model.dart';

// PlaylistRepo
abstract class PlaylistRepo {
  /// gets all playlists from the database
  Future<List<PlaylistModel>> getAllPlaylists();

  /// gets a playlist from the database
  Future<PlaylistModel> getPlaylist(int playlistId); 

  /// adds a new playlist to the database
  Future<void> addPlaylist(PlaylistModel playlist);

  /// updates an existing playlist in the database
  Future<void> updatePlaylist(PlaylistModel playlist);

  /// removes a playlist from the database
  Future<void> removePlaylist(int playlistId);

  /// adds a song to a playlist
  Future<void> addSong(SongModel songModel, int playlistId);

  /// updates a song in the playlist
  Future<void> updateSong(SongModel songModel, int playlistId);

  /// deletes a song from the playlist
  Future<void> deleteSong(SongModel songModel, int playlistId);
}