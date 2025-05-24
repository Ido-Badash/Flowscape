/*

ISAR task model
this is the task model that is used to store the task object in the db

Converts a task model to an isar task model
*/

import 'package:flowscape/features/tasks/domain/models/task.dart';
import 'package:isar/isar.dart';

// to generate isar task object, run: "dart run build_runner build"
part 'isar_task.g.dart';

@Collection()
class TaskIsar {
  Id id; // Uinique ID for the task
  late String text;
  late bool isComplete;

  TaskIsar({this.id = Isar.autoIncrement, this.text = "", this.isComplete = false});

  /// converts a task object -> isar task object
  Task toDomain() {
    return Task(id: id, text: text, isComplete: isComplete);
  }

  /// converts an isar task object -> task object
  static TaskIsar fromDomain(Task task) {
    return TaskIsar(id: task.id, text: task.text, isComplete: task.isComplete);
  }
}
