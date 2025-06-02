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

TODO: Make the class with a factory constructor to call init()

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
  List<SongModel> _songs;
  final String title;
  final String creator;

  // optional
  final String description;
  final PlaylistOrder order;
  final bool shuffle;
  final String playlistImagePath;

  // private
  int _currentSongIdx;
  Duration _currentSongTime = Duration.zero;
  final Random _random = Random();

  // getters
  int get currentSongIdx => _currentSongIdx;
  Duration get currentSongTime => _currentSongTime;
  int get currentSongSec => currentSongTime.inSeconds;
  List<SongModel> get songs => _songs;
  // TODO: fix this blue line

  // setters
  set currentSongIdx(int idx) {
    if (idx >= 0 && idx < _songs.length) {
      _currentSongIdx = idx;
    } else {
      throw RangeError('Index out of range for songs list');
    }
  }

  set currentSongTime(Duration time) {
    final int currentSongInSec = _songs[_currentSongIdx].duration.inSeconds;
    if (time < Duration.zero || time.inSeconds > currentSongInSec) {
      throw ArgumentError(
        'Current song time must be between 0 and $currentSongInSec seconds.',
      );
    }
    _currentSongTime = time;
  }

  // If you want to allow replacing the whole song list:
  set songs(List<SongModel> songModels) {
    _songs = songModels;
  }

  // constructor
  PlaylistModel({
    required this.id,
    int currentSongIdx = 0,
    Duration currentSongTime = Duration.zero,
    List<SongModel> songs = const [],
    required this.title,
    required this.creator,
    this.description = "",
    this.order = PlaylistOrder.normal,
    this.shuffle = false,
    this.playlistImagePath = "assets/images/playlists/default_cover.png",
  }) : _songs = List<SongModel>.from(songs),
       _currentSongIdx = currentSongIdx,
       _currentSongTime = currentSongTime;

  void init() {
    updateSongs();
  }

  void updateSongs() {
    if (shuffle) {
      _songs.shuffle(_random);
    }
    switch (order) {
      case PlaylistOrder.byCreator:
        _orderByCreator();
        break;
      case PlaylistOrder.byCreatorFlipped:
        _orderByCreator(flipped: true);
        break;
      case PlaylistOrder.byTime:
        _orderByTime();
        break;
      case PlaylistOrder.byTimeFlipped:
        _orderByTime(flipped: true);
        break;
      case PlaylistOrder.byTitle:
        _orderByTitle();
        break;
      case PlaylistOrder.byTitleFlipped:
        _orderByTitle(flipped: true);
        break;
      case PlaylistOrder.flipped:
        _flip();
        break;
      default:
        // Do nothing for normal order
        break;
    }
  }

  void _orderByCreator({bool flipped = false}) {
    _willItFlip(
      flipped,
      () => _songs.sort((a, b) => a.artist.compareTo(b.artist)),
    );
  }

  void _orderByTime({bool flipped = false}) {
    _willItFlip(
      flipped,
      () => _songs.sort(
        (a, b) => a.duration.inSeconds.compareTo(b.duration.inSeconds),
      ),
    );
  }

  void _orderByTitle({bool flipped = false}) {
    _willItFlip(
      flipped,
      () => _songs.sort((a, b) => a.title.compareTo(b.title)),
    );
  }

  void _flip() => _songs = _songs.reversed.toList();

  void _willItFlip(bool flipped, void Function() func) {
    func();
    if (flipped) _flip();
  }

  // NEXT
  void next() {
    currentSongIdx = (currentSongIdx + 1) % _songs.length;
  }

  // PREVIOUS
  void previous() {
    currentSongIdx = (currentSongIdx - 1 + _songs.length) % _songs.length;
  }
}
