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
    return Scaffold(
      body: BlocBuilder<MusicCubit, List<PlaylistModel>>(
        builder: (context, playlists) {
          if (playlists.isEmpty) {
            return const Center(child: Text('No playlists available.'));
          }
          return ListView.builder(
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return ListTile(
                title: Text(playlist.title),
                // Add more playlist details here as needed
              );
            },
          );
        },
      ),
    );
  }
}
