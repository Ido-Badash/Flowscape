/*

MUSIC VIEW: responsible for UI

- use BlocBuilder

*/

import 'package:flowscape/features/music/domains/playlist/models/playlist_model.dart';
import 'package:flowscape/features/music/presentation/widgets/playlist/playlist_button.dart';
import 'package:flowscape/features/music/presentation/widgets/widgets_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'music_cubit.dart';

// MusicView
class MusicView extends StatelessWidget {
  const MusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MusicCubit, List<PlaylistModel>>(
        builder: (context, playlists) {
          if (playlists.isEmpty) {
            return const Center(child: Text('No playlists available.'));
          }
          return buildPlaylistsPage(playlists);
        },
      ),
    );
  }

  Widget buildPlaylistsPage(List<PlaylistModel> playlists) {
    if (playlists.isEmpty) {
      return const Center(child: Text('No playlists available.'));
    }
    return GridView.builder(
      itemCount: playlists.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, idx) {
        final playlist = playlists[idx];
        debugPrint("On playlist: ${playlist.title}");
        // Wrap PlaylistButton with Align and IntrinsicWidth/IntrinsicHeight to shrink its tap area
        return PlaylistButton(playlist: Playlist(playlist: playlist));
      },
    );
  }
}
