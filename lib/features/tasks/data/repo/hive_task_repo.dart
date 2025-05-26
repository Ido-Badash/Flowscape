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
    // returns as a list of tasks and give to domian layer
    return _db.values.map((taskHive) => taskHive.toDomain()).toList();
  }

  /// add a task
  @override
  Future<void> addTask(Task task) async {
    // converts Task obj to an Hive obj
    TaskHive taskHive = TaskHive.fromDomain(task);

    // adds Hive obj to the db
    // If id is not a valid int, use add() instead of put()
    if (taskHive.id >= 0 && taskHive.id <= 0xFFFFFFFF) {
      return _db.put(taskHive.id, taskHive);
    } else {
      await _db.add(taskHive); // Let Hive assign the key
    }
  }

  /// update a task
  @override
  Future<void> updateTask(Task task) async {
    // converts Task obj to an Hive obj
    TaskHive taskHive = TaskHive.fromDomain(task);

    // adds Hive obj to the db
    return _db.put(taskHive.id, taskHive);
  }

  /// delete a task
  @override
  Future<void> deleteTask(Task task) async {
    // removes Hive obj from the db
    await _db.delete(task.id);
  }
}
