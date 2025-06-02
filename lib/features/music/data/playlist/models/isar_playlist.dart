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
part 'isar_playlist.g.dart';

// IsarPlaylist
@collection
class IsarPlaylist {
  Id id = Isar.autoIncrement;
  int currentSongIndex = 0;
  int currentSongTimeSec = 0;
  IsarLinks<IsarSong> songs = IsarLinks<IsarSong>();
  bool isShuffled = false;
  String playlistImagePath = "assets/images/playlists/default_cover.png";
  late String title;
  late String creator;

  @Enumerated(EnumType.name)
  late PlaylistOrder order;
  // PlaylistOrder is an enum so @Enumerated is used to store it as a string

  // getters
  // the [@ignore] here is used to ignore those getters in the db
  @ignore
  List<SongModel> get moduleSongs =>
      songs.map((isarSong) => isarSong.toDomain()).toList();

  @ignore
  Duration get currentSongTime => Duration(seconds: currentSongTimeSec);
  // Dursation and SongModel arent supported by isar

  // convert playlist db -> playlist domain
  PlaylistModel toDomain() {
    return PlaylistModel(
      id: id,
      currentSongIdx: currentSongIndex,
      currentSongTime: currentSongTime,
      title: title,
      creator: creator,
      songs: moduleSongs,
      playlistImagePath: playlistImagePath,
      order: order,
      shuffle: isShuffled,
    );
  }

  // convert playlist domain -> playlist db
  static Future<IsarPlaylist> fromDomain(
    PlaylistModel playlist,
    Isar isar,
  ) async {
    final isarPlaylist =
        IsarPlaylist()
          ..id = playlist.id
          ..currentSongIndex = playlist.currentSongIdx
          ..currentSongTimeSec = playlist.currentSongSec
          ..creator = playlist.creator
          ..title = playlist.title
          ..order = playlist.order
          ..playlistImagePath = playlist.playlistImagePath
          ..isShuffled = playlist.shuffle;
    return isarPlaylist;
  }

  // add to the linked songs with a SongModel
  Future<void> addSong(SongModel song, Isar isar) async {
    final isarSong = IsarSong.fromDomain(song);
    await isar.writeTxn(() async {
      await isar.collection<IsarSong>().put(isarSong);
      songs.add(isarSong);
    });
  }
}
