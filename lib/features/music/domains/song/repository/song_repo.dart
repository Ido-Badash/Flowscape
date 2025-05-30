/*

SONG REPO
pure dart code

Here is an abstracted class that defines the operations
the app can do with the songs.
stuff like pausing a song and resuming with the savePlayback

--------------------------------------------------------
~~~ METHODS ~~~
* - savePlayback()
    saves the playback of the song so in the Future it can store
    where it stoped

* - update()
    updates the song in the database

* - delete()
    deletes the song from the database

--------------------------------------------------------
~~~ NOTES ~~~
- all of the method are Future<void>

*/

// PlaylistRepo
import 'package:flowscape/features/music/domains/domains_lib.dart';

abstract class SongRepo {
  /// saves the playback the song and stores it in the database
  Future<void> savePlayback(int songId);

  /// Updates the song in the database
  Future<void> update(SongModel song);

  /// Deletes the song from the database
  Future<void> delete(int songId);
}
