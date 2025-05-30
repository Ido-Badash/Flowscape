/*
ISAR PLAYLIST MODEL
can convert a pure playlist model into a isar playlist model
and vice versa.

-----------------------------------------------------------------------
~~~ PROPERTIES ~~~

* - id
    Id
    ? NOTE: the id will be equal to Isar.autoIncrement by default

* - currentSongIndex
    int
    
* - currentSongTime
    int

* - songs
    List<IsarSong>
    ? NOTE: this is a list of songs that are stored in the isar db

* - isShuffled
    bool

* - title
    late String
    
* - creator
    late String

* - order
    PlaylistOrder

-----------------------------------------------------------------------
~~~ METHODS ~~~

* - toDomain()
    converts the isar playlist object into a pure playlist object
    returns -> Playlist object

* - static fromDomain(Playlist playlist)
    converts a pure playlist object into an isar playlist object
    returns -> IsarPlaylist object

* - _isarToModelsSongs(List<IsarSong> songs)
    converts a list of isar songs into a list of module songs
    returns -> List<SongModel>

* - static _modelsToIsarSongs(List<SongModel> songs)
    converts a list of module songs into a list of isar songs
    returns -> List<IsarSong>

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
// TODO: remove the //! comment when i finish the data layer

// IsarPlaylist
@collection
class IsarPlaylist {
  Id id = Isar.autoIncrement;
  int currentSongIndex = 0;
  int currentSongTimeSec = 0;
  List<IsarSong> songs = [];
  bool isShuffled = false;
  late String title;
  late String creator;

  @Enumerated(EnumType.name)
  late PlaylistOrder order;
  // PlaylistOrder is an enum so @Enumerated is used to store it as a string

  // getters
  List<SongModel> get moduleSongs => _isarToModelsSongs(songs);

  @ignore
  Duration get currentSongTime => Duration(seconds: currentSongTimeSec);
  // the [@ignore] here is used to ignore this getter in the db
  // Dursation is not supported by isar

  // convert playlist db -> playlist domain
  PlaylistModel toDomain() {
    return PlaylistModel(
      id: id,
      currentSongIdx: currentSongIndex,
      currentSongTime: currentSongTime,
      title: title,
      creator: creator,
      songs: moduleSongs,
      order: order,
      shuffle: isShuffled,
    );
  }

  // convert playlist domain -> playlist db
  static IsarPlaylist fromDomain(PlaylistModel playlist) {
    return IsarPlaylist()
      ..id = playlist.id
      ..currentSongIndex = playlist.currentSongIdx
      ..currentSongTimeSec = playlist.currentSongSec
      ..creator = playlist.creator
      ..title = playlist.title
      ..songs = _modelsToIsarSongs(playlist.songs)
      ..order = playlist.order
      ..isShuffled = playlist.shuffle;
  }

  // convert songs db -> songs domain
  List<SongModel> _isarToModelsSongs(List<IsarSong> songs) {
    return songs.map((isarSong) => isarSong.toDomain()).toList();
  }

  // convert songs domain -> songs db
  static List<IsarSong> _modelsToIsarSongs(List<SongModel> songs) {
    return songs.map((song) => IsarSong.fromDomain(song)).toList();
  }
}
