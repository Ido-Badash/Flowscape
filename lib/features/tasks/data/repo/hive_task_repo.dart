/*

DATABASE REPO 

Handles data storage from task repo

*/

import 'package:flowscape/features/tasks/data/models/hive_task_model.dart';
import 'package:flowscape/features/tasks/domain/models/task_model.dart';
import 'package:flowscape/features/tasks/domain/repo/task_repo.dart';
import 'package:hive/hive.dart';

class HiveTaskRepo implements TaskRepo {
  // database
  late final Box<TaskHive> _db;

  HiveTaskRepo() {
    _db = Hive.box<TaskHive>("tasksBox");
  }

  /// get all tasks
  @override
  Future<List<Task>> getAllTasks() async {
    // Iterate over keys and get the value for each key
    return _db.keys.map((key) {
      final taskHive = _db.get(key)!;
      return taskHive.toDomain(id: key);
    }).toList(); // return as a list of Tasks
  }

  /// add a task
  @override
  Future<void> addTask(Task task) async {
    // converts Task obj to an Hive obj
    TaskHive taskHive = TaskHive.fromDomain(task);

    // adds Hive obj to the db
    await _db.add(taskHive); // Lets Hive assign the key
  }

  /// update a task
  @override
  Future<void> updateTask(Task task) async {
    // converts Task obj to an Hive obj
    TaskHive taskHive = TaskHive.fromDomain(task);

    // updates Hive obj in the db
    await _db.put(taskHive.id, taskHive);
  }

  /// delete a task
  @override
  Future<void> deleteTask(Task task) async {
    // removes Hive obj from the db
    await _db.delete(task.id);
  }
}
