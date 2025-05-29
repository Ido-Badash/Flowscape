/*

SONG MODEL
This is what a song object is.

--------------------------------------------------------------------------------
~~~ PROPERTIES ~~~

* - required:
  - title
      String

  - artist
      String

  - audioFilePath
      String
      ? NOTE: file is an mp3 file and it wil decide how long the song is

* - optional:
  - album
      String
      ? NOTE: the album the song is from

  - coverImagePath
      String
      ? NOTE: the path to the cover image of the song

  - genre
      String

  - lyrics
      String

  - releaseDate
      String
      ? NOTE: the release date of the song in ISO 8601 format

* - private:
  - _duration
      int
      ? NOTE: in seconds, will have the duration of the song file

  - _currentSongTime
      int
      ? NOTE: in seconds, will have the current time of the song being played

--------------------------------------------------------------------------------
~~~ METHODS ~~~

* - play({int fromTime = 0})
    plays the song from the start or from a specific time

--------------------------------------------------------------------------------
~~~ MODEL NOTES ~~~
TODO: make the class with a async factory constructor
*/

// Imports
import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

// PlaylistModel

class SongModel {
  // required
  final String title;
  final String artist;
  final String audioFilePath;

  // optional
  final String? album;
  final String? coverImagePath;
  final String? genre;
  final String? lyrics;
  final String? releaseDate;

  // private
  Duration _duration; // in seconds, will have the duration of the song file
  int _currentSongTime; // in seconds

  // getters
  int get currentSongTime => _currentSongTime;
  Duration get duration => _duration;

  // setters
  set currentSongTime(int time) {
    if (time < 0 || time > duration.inSeconds) {
      throw ArgumentError(
        'Current song time must be between 0 and ${duration.inSeconds} seconds.',
      );
    }
    _currentSongTime = time;
  }

  set duration(Duration duration) {
    if (duration.inSeconds < 0) {
      throw ArgumentError('Song duration cannot be negative.');
    }
    _duration = duration;
  }

  // constructor
  /// Make sure to call `init()` after creating an instance to set the initial duration.
  SongModel({
    required this.title,
    required this.artist,
    required this.audioFilePath,
    this.album,
    this.coverImagePath,
    this.genre,
    this.lyrics,
    this.releaseDate,
    int currentSongTime = 0,
  }) : _currentSongTime = currentSongTime,
       _duration = Duration(seconds: 0); // will be set later when the song is loaded

  Future<void> init() async{
    await setInitialDuration();
  }

  Future<void> setInitialDuration() async {
    File imageFile = File(audioFilePath);
    if (!await imageFile.exists()) {
      throw FileSystemException('Audio file does not exist', audioFilePath);
    }
    try {
      final metadata = readMetadata(imageFile, getImage: false);
      duration = metadata.duration ?? Duration(seconds: 0);
    } catch (e) {
      debugPrint('Error reading metadata for $audioFilePath: $e');
    }
  }

  // PLAY
  void play({int fromTime = 0}) {
    currentSongTime = fromTime;
  }
}
