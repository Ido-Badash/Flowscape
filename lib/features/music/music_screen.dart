/*
Displays all the playlists
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowscape/features/music/presentation/music_cubit.dart';
import 'package:flowscape/features/music/domains/playlist/repository/playlist_repo.dart';
import 'package:provider/provider.dart';
import 'presentation/music_view.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistRepo = Provider.of<PlaylistRepo>(context, listen: false);
    return BlocProvider(
      create: (_) => MusicCubit(playlistRepo),
      child: const MusicView(),
    );
  }
}
