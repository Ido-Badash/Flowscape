import 'package:flowscape/features/todo/data/models/isar_todo.dart';
import 'package:flowscape/features/todo/data/repository/isar_todo_repo.dart';
import 'package:flowscape/features/todo/domain/repository/todo_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'features/app/app.dart';
import 'core/styles/themes.dart';
import 'features/settings/appearance/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // where all the user-generated data goes
  final dir = await getApplicationDocumentsDirectory();

  // open isar db
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // init todo repo
  final todoRepo = IsarTodoRepo(isar);

  runApp(
    Provider<TodoRepo>.value(
      value: todoRepo,
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
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
