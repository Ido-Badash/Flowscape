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

* - savePlayback(int songId, int currentTimeSec)
    saved the playback of the song and stores it in the database

* - update(SongModel song)
    updates the song in the database

* - delete(int songId)
    deletes the song from the database

* - getSong(int id)

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

  // savePlayback song
  @override
  Future<void> savePlayback(int songId, int currentTimeSec) async {
    // fetch song
    final IsarSong song = IsarSong.fromDomain(await getSong(songId));

    // simple output for debugging
    if (currentTimeSec > 0) {
      debugPrint('INFO: Song stopped at $currentTimeSec seconds');
    }

    // update the song in the db
    await db.writeTxn(() async {
      song.currentSongTime = currentTimeSec;
      // save the updated song
      try {
        await db.collection<IsarSong>().put(song);
      } catch (e) {
        debugPrint("FATAL: Failed to save playback in the database.");
        return;
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
      return;
    }

    // fetch song
    final IsarSong isarSong = IsarSong.fromDomain(song);

    // update the song in the db
    await db.writeTxn(() async {
      try {
        await db.collection<IsarSong>().put(isarSong);
      } catch (e) {
        debugPrint("FATAL: Failed to update song in the database.");
        rethrow;
      }
    });
  }

  // delete song
  @override
  Future<void> delete(int songId) async {
    // delete song from db
    await db.writeTxn(() async {
      try {
        await db.collection<IsarSong>().delete(songId);
      } catch (e) {
        debugPrint("FATAL: Failed to delete song from the database.");
        rethrow;
      }
    });
  }

  @override
  Future<SongModel?> getSong(int id) async {
    final IsarSong? isarSong = await db.collection<IsarSong>().get(id);
    return isarSong?.toDomain();
  }
}
