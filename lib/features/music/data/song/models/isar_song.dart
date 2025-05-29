/*
TODO: make a Doc
*/

// Imports
import 'package:flowscape/features/music/domains/song/song_lib.dart';

class IsarSong {
  SongModel toDomain() { // TODO: make this function
    return SongModel(id: 1, title: "", artist: "", audioFilePath: "");
  }

  static IsarSong fromDomain(SongModel song) {
    return IsarSong(); // TODO: implement conversion from SongModel to IsarSong
  }
}

// TODO: make the class based on the Doc
