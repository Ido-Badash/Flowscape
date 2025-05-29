/*

SONG REPO
pure dart code

Here is an abstracted class that defines the operations
the app can do with the songs.
stuff like pausing a song and resuming

--------------------------------------------------------
~~~ METHODS ~~~
* - stop()
    stops the song so in the Future it can store
    where it stoped
    params:
      int songId

* - resume()
    paired with the stop() function
    it can resume after a stop was made
    so it fetches from where it was stopped
    last time
    params:
      int songId

--------------------------------------------------------
~~~ NOTES ~~~
- all of the method are Future<void>

*/

// PlaylistRepo
abstract class SongRepo {
  /// Stops the song and stores the playback in the database
  Future<void> stop(int songId);

  /// Resumes the song by fetching the playback stopped in the database
  Future<void> resume(int songId);
}
