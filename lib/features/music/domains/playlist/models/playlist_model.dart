/*

PLAYLIST MODEL
This is what a playlist object is.

--------------------------------------------------------------------------------
~~~ PROPERTIES ~~~

*- required:
  - currentSongIdx
      int
      ? NOTE: tracks the current idx in the songs list

  - title
      String

  - songs
      List<SongModel>

  - creator
      String

*- optional:
  - description
      String?

  - order
      PlaylistOrder?
      ? NOTE: PlaylistOrder is an enum and is [PlaylistOrder.normal] by default

  - shuffle
      bool
      ? NOTE: give shuffle a value that will be stored in a database [false] by default

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

* - play({int atSongIdx = 0})
    starts playing a song from the start aka idx 0

* - stop()
    stops a song but keeps track of what song and when was stopped
    later on the what song and when will be stored in a database
    so continue() can get to it

* - continue()
    takes the pending song from the database after stop() was called
    if continue() is called but stop() wasent its just going to call play()

--------------------------------------------------------------------------------
~~~ MODEL NOTES ~~~

- What this model trying to do is just control the currentSongIdx

*/

// Imports
import 'package:flowscape/features/music/domains/song/model/song_model.dart';
import 'playlist_order.dart';

// PlaylistModel
class PlaylistModel {
  // required
  final String title;
  final List<SongModel> songs;
  final String creator;

  // non-required
  final int currentSongIdx;
  final String? description;
  final PlaylistOrder? order;
  final bool shuffle;

  // constructor
  const PlaylistModel({
    this.currentSongIdx = 1,
    required this.songs,
    required this.title,
    required this.creator,
    this.description,
    this.order,
    this.shuffle = false
    });
}
