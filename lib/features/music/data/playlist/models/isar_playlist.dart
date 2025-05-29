/*
ISAR PLAYLIST MODEL
can convert a pure playlist model into a isar playlist model
and vice versa.

-----------------------------------------------------------------------
~~~ PROPERTIES ~~~

* - id
    Id
    ? NOTE: the id will be equal to Isar.autoIncrement by default

* - songs
    late List<IsarSong>
    ? NOTE: this is a list of songs that are stored in the isar db

* - isShuffled
    late bool

* - title
    late String
    
* - creator
    late String

* - order
    late PlaylistOrder

-----------------------------------------------------------------------
~~~ METHODS ~~~

* - toDomain()
    converts the isar playlist object into a pure playlist object
    returns -> Playlist object

* - static fromDomain(Playlist playlist)
    converts a pure playlist object into an isar playlist object
    returns -> IsarPlaylist object

-----------------------------------------------------------------------
~~~ NOTES ~~~
- This class will NOT have a constructor

- DO NOT remove the [part 'isar_playlist.g.dart']
  its for the database entire build

*/

// imports
import 'package:flowscape/features/music/data/song/song_lib.dart';
import 'package:flowscape/features/music/domains/playlist/models/playlist_order.dart';
import 'package:flowscape/features/music/domains/song/model/song_model.dart';
import 'package:isar/isar.dart';
import 'package:flowscape/features/music/domains/playlist/models/playlist_model.dart';

// generate isar playlist object, run: "dart run build_runner build"
//! part 'isar_playlist.g.dart'

// IsarPlaylist
@collection
class IsarPlaylist {
  Id id = Isar.autoIncrement;
  late List<IsarSong> songs;
  late bool isShuffled;
  late String title;
  late String creator;
  late PlaylistOrder order = PlaylistOrder.normal;

  late List<SongModel> moduleSongs = _isarToModelsSongs(songs);

  // convert isar object -> pure playlist object to use in our app
  PlaylistModel toDomain() {
    return PlaylistModel(
      id: id,
      title: title,
      creator: creator,
      songs: moduleSongs,
      order: order,
      shuffle: isShuffled);
  }

  // convert pure playlist object -> isar object to store in isar db
  static IsarPlaylist fromDomain(PlaylistModel playlist) {
    return IsarPlaylist()
      ..id = playlist.id
      ..songs = _modelsToIsarSongs(playlist.songs)
      ..isShuffled = playlist.shuffle;

  }

  static List<SongModel> _isarToModelsSongs(List<IsarSong> songs) {
    return songs.map((isarSong) => isarSong.toDomain()).toList();
  }

  static List<IsarSong> _modelsToIsarSongs(List<SongModel> songs) {
    return songs.map((song) => IsarSong.fromDomain(song)).toList();
  }
}