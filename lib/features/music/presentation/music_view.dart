/*

MUSIC VIEW: responsible for UI

- use BlocBuilder

*/

import 'package:flowscape/features/music/domains/playlist/models/playlist_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'music_cubit.dart';
import 'playlists/playlists_lib.dart'; // Importing the playlists library

// MusicView
class MusicView extends StatelessWidget {
  const MusicView({super.key});

  @override
  Widget build(BuildContext context) {
    // get the MusicCubit
    final musicCubit = context.read<MusicCubit>();

    // initialize the CalmPlaylist
    CalmPlaylist.init();

    return Scaffold(
      body: BlocBuilder<MusicCubit, List<PlaylistModel>>(
        builder: (context, state) {
          return SizedBox.shrink();
        },
      ),
    );
  }
}
