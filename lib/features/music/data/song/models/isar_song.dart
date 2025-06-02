/*
ISAR SONG MODEL
can convert a pure song model into a isar song model
and vice versa.

-----------------------------------------------------------------------
~~~ PROPERTIES ~~~

* - id
    Id
    ? NOTE: the id will be equal to Isar.autoIncrement by default

* - title
    late String

* - artist
    late String

* - audioFilePath
    late String

* - currentSongTime 
    int

-----------------------------------------------------------------------
~~~ METHODS ~~~

* - toDomain()
    converts the isar song object into a pure song object
    returns -> SongModel object

* - static fromDomain(Playlist playlist)
    converts a pure song object into an isar song object
    returns -> IsarSong object

-----------------------------------------------------------------------
~~~ NOTES ~~~
- This class will NOT have a constructor

- DO NOT remove the [part 'isar_song.g.dart']
  its for the database entire build

*/

// Imports
import 'package:flowscape/features/music/domains/song/song_lib.dart';
import 'package:isar/isar.dart';

// generate isar song object, run: "dart run build_runner build"
part 'isar_song.g.dart';

// IsarSong
@collection
class IsarSong {
  Id id = Isar.autoIncrement;
  int currentSongTime = 0;
  String coverImagePath = "assets/images/songs/default_cover.jpg";
  late String title;
  late String artist;
  late String audioFilePath;

  // getters
  @ignore
  Duration get currentSongTimeDur => Duration(seconds: currentSongTime);

  /// convert song db -> domain db
  SongModel toDomain() {
    return SongModel(
      id: id,
      title: title,
      artist: artist,
      audioFilePath: audioFilePath,
      currentSongTime: currentSongTimeDur,
      coverImagePath: coverImagePath,
    );
  }

  /// convert song domain -> song db
  static IsarSong fromDomain(SongModel? song) {
    return IsarSong()
      ..id = song!.id as Id
      ..title = song.title
      ..artist = song.artist
      ..audioFilePath = song.audioFilePath
      ..currentSongTime = song.currentSongTime.inSeconds
      ..coverImagePath = song.coverImagePath;
  }
}
