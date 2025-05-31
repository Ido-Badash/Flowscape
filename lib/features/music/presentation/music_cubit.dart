/*

MUSIC CUBIT
the glue between the UI and DATA layer
simple state management

each cubit is a list of playlists
and each playlist is a list of songs

*/

// imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowscape/features/music/domains/domains_lib.dart';

// MusicCubit
class MusicCubit extends Cubit<List<PlaylistModel>> {
  // repo
  final PlaylistRepo playlistRepo;

  MusicCubit(this.playlistRepo) : super([]) {
    loadPlaylists();
  }

  // L O A D
  Future<void> loadPlaylists() async {
    // fetch list of songs from repo
    final playlists = await playlistRepo.getAllPlaylists();

    // emit the fetched list as the new state
    emit(playlists);
  }

  // A D D
  Future<void> addSong(SongModel song, int playlistId) async {
    // create a new song with unique Id
    final newSong = song.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
      title: song.title,
      artist: song.artist,
      audioFilePath: song.audioFilePath,
    );
    // save the new song to repo
    await playlistRepo.addSong(newSong, playlistId);

    // re-load
    loadPlaylists();
  }

  // D E L E T E
  Future<void> deleteSong(SongModel song, int playlistId) async {
    // delete the provided song from repo
    await playlistRepo.deleteSong(song, playlistId);

    // re-load
    loadPlaylists();
  }
}
