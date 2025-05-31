// flutter SDK
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// third-party package
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// features
// page: todo
import 'features/todo/data/models/isar_todo.dart';
import 'features/todo/data/repository/isar_todo_repo.dart';
import 'features/todo/domain/repository/todo_repo.dart';

// page: music
import 'features/music/music_lib.dart';

// app
import 'features/app/app.dart';
import 'core/styles/themes.dart';
import 'features/settings/appearance/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // where all the user-generated data goes
  final dir = await getApplicationDocumentsDirectory();

  // open isar db
  final isar = await Isar.open([
    TodoIsarSchema,
    IsarPlaylistSchema,
    IsarSongSchema,
  ], directory: dir.path);

  // init todo repo
  final todoRepo = IsarTodoRepo(isar);

  // init music repos
  final playlistRepo = IsarPlaylistRepo(isar);
  final songRepo = IsarSongRepo(isar);

  // developer manuel playlists addings
  // playlistRepo.addPlaylist(CalmPlaylist());

  runApp(
    MultiProvider(
      providers: [
        Provider<TodoRepo>.value(value: todoRepo),
        Provider<PlaylistRepo>.value(value: playlistRepo),
        Provider<SongRepo>.value(value: songRepo),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    _updateSystemUIOverlayStyle();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlowScape",
      theme: Provider.of<ThemeProvider>(context).themeData,
      themeMode: ThemeMode.system,
      home: const FlowScape(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _updateSystemUIOverlayStyle();
  }

  void _updateSystemUIOverlayStyle() {
    final Brightness brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            isDarkMode
                ? appDarkThemeData.bottomNavigationBarTheme.backgroundColor
                : appLightThemeData.bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}
