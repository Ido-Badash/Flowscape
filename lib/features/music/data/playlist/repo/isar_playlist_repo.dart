/*

ISAR SONG REPO

This implements the playlist repo and handles:
- fetching
- addings
- updating
- deleting

-----------------------------------------------------------------------------
~~~ PROPERTIES ~~~
* - db
    Isar database instance

-----------------------------------------------------------------------------
~~~ METHODS ~~~
the methods down below are with the @override tag
those methods can be found at the PlaylistRepo class in the playlist domain layer
also they are asynchronous methods with the Future<T> type

* - getAllPlaylists()
    gets all playlists from the database

* - addSong(SongModel songModel, int playlistId)
    adds a song to a playlist

* - updateSong(SongModel songModel, int playlistId)
    updates a song in the playlist

* - deleteSong(SongModel songModel, int playlistId)
    deletes a song from the playlist

*/

// imports
import 'package:flowscape/features/music/data/data_lib.dart';
import 'package:flowscape/features/music/domains/domains_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

// IsarPlaylistRepo
class IsarPlaylistRepo implements PlaylistRepo {
  // db
  final Isar db;

  // getters
  IsarCollection<IsarPlaylist> get isarPlaylists =>
      db.collection<IsarPlaylist>();

  IsarCollection<IsarSong> get isarSongs => db.collection<IsarSong>();

  IsarPlaylistRepo(this.db);

  // getAllPlaylists
  @override
  Future<List<PlaylistModel>> getAllPlaylists() async {
    final List<IsarPlaylist> playlists = await isarPlaylists.where().findAll();
    return playlists.map((isarPlaylist) {
      final PlaylistModel playlist = isarPlaylist.toDomain();
      playlist.init();
      return playlist;
    }).toList();
  }

  // getPlaylist
  @override
  Future<PlaylistModel> getPlaylist(int playlistId) async {
    final IsarPlaylist? isarPlaylist = await isarPlaylists.get(playlistId);
    final PlaylistModel playlist = isarPlaylist!.toDomain();
    playlist.init();
    return playlist;
  }

  // addSong
  @override
  Future<void> addSong(SongModel songModel, int playlistId) async {
    await db.writeTxn(() async {
      try {
        // Convert and save the song (if not already in DB)
        final IsarSong isarSong = IsarSong.fromDomain(songModel);
        final int songId = await isarSongs.put(isarSong);

        // Fetch the playlist
        final IsarPlaylist? playlist = await _playlist(playlistId);
        if (playlist == null) {
          throw Exception(
            "FATAL: Playlist not found while trying to add a song",
          );
        }

        // Link the song to the playlist
        final IsarSong? songInDb = await _song(songId);
        if (songInDb != null) {
          final IsarLinks<IsarSong> linkedSongs = playlist.songs;
          linkedSongs.add(songInDb);
          await linkedSongs.save();
        }
      } catch (e) {
        debugPrint("FATAL: Failed to add song to the playlist.");
        rethrow;
      }
    });
  }

  // updateSong
  @override
  Future<void> updateSong(SongModel songModel, int playlistId) async {
    await addSong(songModel, playlistId);
  }

  // deleteSong
  @override
  Future<void> deleteSong(SongModel songModel, int playlistId) async {
    await db.writeTxn(() async {
      try {
        // Convert song and put in db
        final IsarSong isarSong = IsarSong.fromDomain(songModel);
        final int songId = await isarSongs.put(isarSong);

        // Fetch playlist from db
        final IsarPlaylist? playlist = await _playlist(playlistId);
        if (playlist == null) {
          throw Exception(
            "FATAL: Playlist not found while trying to delete a song",
          );
        }

        // remove from linked songs
        final IsarSong? songInDb = await _song(songId);
        if (songInDb != null) {
          final IsarLinks<IsarSong> linkedSongs = playlist.songs;
          linkedSongs.remove(songInDb);
          await linkedSongs.save();
        }
      } catch (e) {
        debugPrint("FATAL: Failed to delete song from the database.");
        rethrow;
      }
    });
  }

  //* private methods
  Future<IsarPlaylist?> _playlist(int playlistId) async {
    final PlaylistModel playlistModel = await getPlaylist(playlistId);
    playlistModel.init();
    return IsarPlaylist.fromDomain(playlistModel, db);
  }

  Future<IsarSong?> _song(int songId) async {
    return await isarSongs.get(songId);
  }
}
