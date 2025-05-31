/*

MUSIC VIEW: responsible for UI

- use BlocBuilder

*/


import 'package:flowscape/features/music/domains/playlist/models/playlist_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'music_cubit.dart';

// MusicView
class MusicView extends StatelessWidget {
  const MusicView({super.key});

  @override
  Widget build(BuildContext context) {
    // cubit
    final musicCubit = context.read<MusicCubit>();

    // SCAFFOLD
    return Scaffold(
      body: SizedBox.shrink(),
    );
  }
}
