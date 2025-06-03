/*
MAIN FILE
run app here
*/

// flutter SDK
import 'package:flowscape/features/flow/timer/flow_timer_controller.dart';
import 'package:flutter/material.dart';

// third-party package
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// features
// page: todo
import 'features/todo/data/models/isar_todo.dart';
import 'features/todo/data/repository/isar_todo_repo.dart';
import 'features/todo/domain/repository/todo_repo.dart';

// app
import 'features/settings/appearance/theme_provider.dart';
import 'package:flowscape/features/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // where all the user-generated data goes
  final dir = await getApplicationDocumentsDirectory();

  // open isar db
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // init todo repo
  final todoRepo = IsarTodoRepo(isar);

  runApp(
    MultiProvider(
      providers: [
        Provider<TodoRepo>.value(value: todoRepo),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FlowTimerController()),
      ],
      child: const MyApp(),
    ),
  );
}
