// Tasks & Hive
import 'package:flowscape/features/tasks/data/task_data_lib.dart';
import 'package:flowscape/features/tasks/domain/repo/task_repo.dart';
import 'package:flowscape/features/tasks/presentation/task_presentation_lib.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/data/hive_boxes_names.dart';

// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';

// flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// dependencies
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

// app and theme
import 'features/app/app.dart';
import 'core/styles/themes.dart';
import 'features/settings/appearance/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // init glue for flutter engine and UI

  // where all the user-generated data goes
  final appDocDir = await getApplicationDocumentsDirectory();

  //* --- Tasks ---
  // To intialise the hive database
  await Hive.initFlutter(appDocDir.path);

  // Register the adapter in the [hive_task_model.g.dart]
  Hive.registerAdapter(TaskHiveAdapter());

  // open Hive db
  await Hive.openBox<TaskHive>(HiveBoxesNames.taskHive);

  //* --- Run App ---
  runApp(
    RepositoryProvider<TaskRepo>(
      create: (_) => HiveTaskRepo(),
      child: BlocProvider(
        create: (cubitContext) => TaskCubit(cubitContext.read<TaskRepo>()),
        child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  // Tasks isar db injection to the app

  const MyApp({super.key});

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
      home: const FlowScape(),
    );
  }
}
