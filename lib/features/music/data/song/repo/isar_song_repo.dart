/*

ISAR SONG REPO

This implements the song repo and handles storing, retrieving, updating,
deleting in the isar database.

-----------------------------------------------------------------------------
~~~ PROPERTIES ~~~
* - db
    Isar database instance

-----------------------------------------------------------------------------
~~~ METHODS ~~~
the methods down below are with the @override tag
those methods can be found at the SongRepo class in the song domain layer
also they are asynchronous methods with the Future<T> type

* - savePlayback(int songId)
    saved the playback of the song and stores it in the database

* - delete(int songId)
    deletes the song from the database

*/

// imports
import 'package:flowscape/features/music/data/data_lib.dart';
import 'package:flowscape/features/music/domains/song/song_lib.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

// IsarSongRepo
class IsarSongRepo implements SongRepo {
  // db
  final Isar db;

  IsarSongRepo(this.db);

  // getPlaylists
  Future<List<IsarPlaylist>> _getPlaylists(int songId) async {
    // Fetch the playlists from the db
    return await db.collection<IsarPlaylist>().where().findAll();
  }

  // getPlaylist
  Future<IsarPlaylist> _getPlaylist(int songId) async {
    final List<IsarPlaylist> playlistDb = await _getPlaylists(songId);
    return playlistDb.firstWhere(
      (playlist) => playlist.songs.any((song) => song.id == songId),
      orElse: () => throw Exception('Playlist not found for song ID: $songId'),
    );
  }

  // songIdToIsarSong
  Future<IsarSong> _songIdToIsarSong(int songId) async {
    // local methods to find the song
    findSong(IsarSong song) => song.id == songId;
    ifDidntFind() => throw Exception('Song not found in playlist');

    // get playlist with the song id
    final IsarPlaylist playlist = await _getPlaylist(songId);

    // find song and return it
    return playlist.songs.firstWhere(findSong, orElse: ifDidntFind);
  }

  // savePlayback song
  @override
  Future<void> savePlayback(int songId) async {
    // fetch song
    final IsarSong song = await _songIdToIsarSong(songId);

    // get the current time of the song
    final int currentTimeSec = song.currentSongTime;

    // simple output for debugging
    if (currentTimeSec > 0) {
      debugPrint('INFO: Song stopped at $currentTimeSec seconds');
    }

    // update the song in the db
    return db.writeTxn(() async {
      song.currentSongTime = currentTimeSec;
      // save the updated song
      try {
        await db.collection<IsarSong>().put(song);
      } catch (e) {
        debugPrint("FATAL: Failed to save playback in the database.");
      }
    });
  }

  // update song
  @override
  Future<void> update(SongModel song) async {
    // get song id
    final int songId = song.id ?? 0;

    if (songId <= 0) {
      debugPrint(
        "FATAL: Attempted to update a song with an invalid ID: $songId",
      );
    }

    // fetch song
    final IsarSong isarSong = await _songIdToIsarSong(songId);

    // update the song in the db
    return db.writeTxn(() async {
      try {
        await db.collection<IsarSong>().put(isarSong);
      } catch (e) {
        debugPrint("FATAL: Failed to update song in the database.");
      }
    });
  }

  // delete song
  @override
  Future<void> delete(int songId) async {
    // fetch song
    final IsarSong song = await _songIdToIsarSong(songId);

    // delete song from db
    await db.writeTxn(() async {
      try {
        await db.collection<IsarSong>().delete(song.id);
      } catch (e) {
        debugPrint("FATAL: Failed to delete song from the database.");
      }
    });
  }
}
