/*

PLAYLIST MODEL
This is what a playlist object is.

--------------------------------------------------------------------------------
~~~ PROPERTIES ~~~

* - required:
  - title
      String

  - songModels
      List<SongModel>

  - creator
      String

* - optional:
  - description
      String

  - order
      PlaylistOrder
      ? NOTE: PlaylistOrder is an enum and is [PlaylistOrder.normal] by default

  - shuffle
      bool
      ? NOTE: give shuffle a value that will be stored in a database [false] by default

  - playlistImagePath
      String

* - private:
  - currentSongIdx
        int
        ? NOTE: tracks the current idx in the songs list
        ? NOTE: this is private so it can be changed only by methods
  
  - random
        Random
        ? NOTE: used for shuffling the songs if shuffle is true

--------------------------------------------------------------------------------
~~~ METHODS ~~~

* - next()
    moves on to the next SongModel object in the list
    and calls the play(atSongIdx: currentSongIdx)
    if next() is called on the last song
    it will wrap around and go to the first song

* - previous()
    just like next() but runs backwards
    so instead of idx + 1, its idx - 1

--------------------------------------------------------------------------------
~~~ MODEL NOTES ~~~

- What this model trying to do is just control the currentSongIdx

*/

// Imports
import 'dart:math';
import 'package:flowscape/features/music/domains/song/model/song_model.dart';
import 'playlist_order.dart';

// PlaylistModel
class PlaylistModel {
  // id
  final int id;

  // required
  List<SongModel> songModels;
  final String title;
  final String creator;

  // optional
  final String description;
  final PlaylistOrder order;
  final bool shuffle;
  final String? playlistImagePath;

  // private
  int _currentSongIdx;
  final Random _random = Random();

  // getters
  int get currentSongIdx => _currentSongIdx;
  List<SongModel> get songs => songModels;

  // setters
  set currentSongIdx(int idx) {
    if (idx >= 0 && idx < songs.length) {
      _currentSongIdx = idx;
    } else {
      throw RangeError('Index out of range for songs list');
    }
  }

  set songs(List<SongModel> songModels) {
    songs = songModels;
  }

  // constructor
  PlaylistModel({
    required this.id,
    int currentSongIdx = 0,
    int currentSongTime = 0,
    required this.songModels,
    required this.title,
    required this.creator,
    this.description = "",
    this.order = PlaylistOrder.normal,
    this.shuffle = false,
    this.playlistImagePath,
  }) : _currentSongIdx = currentSongIdx,

       assert(songModels.isNotEmpty, 'Songs list cannot be empty');

  void updateSongs() {
    if (shuffle) {
      songs.shuffle(_random);
    }
    switch (order) {
      // by creator
      case PlaylistOrder.byCreator:
        _orderByCreator();
      case PlaylistOrder.byCreatorFlipped:
        _orderByCreator(flipped: true);

      // by time
      case PlaylistOrder.byTime:
        _orderByTime();
      case PlaylistOrder.byTimeFlipped:
        _orderByTime(flipped: true);

      // by title
      case PlaylistOrder.byTitle:
        _orderByTitle();
      case PlaylistOrder.byTitleFlipped:
        _orderByTitle(flipped: true);

      // normal and flipped
      case PlaylistOrder.flipped:
        _flip();
      default:
        songs = songs;
    }
  }

  void _orderByCreator({bool flipped = false}) {
    _willItFlip(
      flipped,
      () => songs.sort((a, b) => a.artist.compareTo(b.artist)),
    );
  }

  void _orderByTime({bool flipped = false}) {
    _willItFlip(
      flipped,
      () => songs.sort(
        (a, b) => a.duration.inSeconds.compareTo(b.duration.inSeconds),
      ),
    );
  }

  void _orderByTitle({bool flipped = false}) {
    _willItFlip(
      flipped,
      () => songs.sort((a, b) => a.title.compareTo(b.title)),
    );
  }

  void _flip() => songs = songs.reversed.toList();

  void _willItFlip(bool flipped, void Function() func) {
    func();
    if (flipped) _flip();
  }

  // NEXT
  void next() {
    currentSongIdx = (currentSongIdx + 1) % songs.length;
  }

  // PREVIOUS
  void previous() {
    currentSongIdx = (currentSongIdx - 1 + songs.length) % songs.length;
  }
}
