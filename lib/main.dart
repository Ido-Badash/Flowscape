// Tasks page stuff
import 'package:flowscape/features/tasks/tasks_lib.dart';
import 'package:flowscape/features/settings/appearance/theme_provider.dart';

// flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// dependencies
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// app and theme
import 'features/app/app.dart';
import 'core/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // init glue for flutter engine and UI

  //* --- Tasks ---
  // get dir path for db storage
  final dir = await getApplicationDocumentsDirectory();

  // open Isar db
  final isarDb = await Isar.open([TaskIsarSchema], directory: dir.path);

  // init task repo with this Isar db
  final isarTaskRepo = IsarTaskRepo(isarDb);

  //* --- Run App ---
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(taskRepo: isarTaskRepo),
    ),
  );
}

class MyApp extends StatefulWidget {
  // Tasks isar db injection to the app
  final TaskRepo taskRepo;

  const MyApp({super.key, required this.taskRepo});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
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

    // the bar at the bottom of the phone
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

  @override
  Widget build(BuildContext context) {
    // Update the system UI overlay style initially
    _updateSystemUIOverlayStyle();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlowScape",
      theme: Provider.of<ThemeProvider>(context).themeData,
      themeMode: ThemeMode.system,
      home: FlowScape(taskRepo: widget.taskRepo),
    );
  }
}
