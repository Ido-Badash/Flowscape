/*

MUSIC PAGE: responsible for providing cubit to view (UI)

- use BlocProvider

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowscape/features/music/domains/playlist/repository/playlist_repo.dart';
import 'music_cubit.dart';
import 'music_view.dart';

class TodoPage extends StatelessWidget {
  final PlaylistRepo playlistRepo;

  const TodoPage({super.key, required this.playlistRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicCubit(playlistRepo),
      child: const MusicView(),
    );
  }
}
