/*
ISAR task model
this is the task model that is used to store the task object in the db
Converts a task model to an isar task model
*/

import 'package:flowscape/features/tasks/domain/models/task_model.dart';
import 'package:isar/isar.dart';

// to generate isar task object, run: "dart run build_runner build"
part 'task_isar.g.dart';

@Collection()
class TaskIsar {
  Id id; // Unique ID for the task
  late String text;
  late bool isComplete;
  TaskIsar({
    this.id = Isar.autoIncrement,
    this.text = "",
    this.isComplete = false,
  });

  /// converts isar task object -> domain task object
  Task toDomain() {
    return Task(id: id, text: text, isComplete: isComplete);
  }

  /// converts domain task object -> isar task object
  static TaskIsar fromDomain(Task task) {
    return TaskIsar(id: task.id, text: task.text, isComplete: task.isComplete);
  }
}
