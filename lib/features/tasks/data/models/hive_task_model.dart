/*

Hive task model
the Task object used in the db

converts a Task obj model into a Hive task model

*/

import 'package:flowscape/features/tasks/domain/models/task_model.dart';
import 'package:flowscape/core/data/hive_type_ids.dart';

import 'package:hive/hive.dart';

part 'hive_task_model.g.dart';

@HiveType(typeId: HiveTypeIds.taskHive)
class TaskHive extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  late String text;

  @HiveField(2)
  late bool isComplete;

  /// If no `id` is provided, it defaults to the current timestamp in milliseconds.
  TaskHive({required this.id, this.text = "", this.isComplete = false});

  /// converts a Task object -> Hive task object
  Task toDomain() {
    return Task(id: id, text: text, isComplete: isComplete);
  }

  /// converts an Hive task object -> Task object
  static TaskHive fromDomain(Task task) {
    return TaskHive(id: task.id, text: task.text, isComplete: task.isComplete);
  }
}
