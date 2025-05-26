/*

DATABASE REPO 

Handles data storage from task repo

*/

import 'package:flowscape/features/tasks/data/models/isar_task_model.dart';
import 'package:flowscape/features/tasks/domain/models/task_model.dart';
import 'package:flowscape/features/tasks/domain/repo/task_repo.dart';
import 'package:isar/isar.dart';

class IsarTaskRepo implements TaskRepo {
  // database
  final Isar db;

  IsarTaskRepo(this.db);

  // get all tasks
  @override
  Future<List<Task>> getAllTasks() async {
    // fetches tasks from database
    final tasks = await db.taskIsars.where().findAll();

    // returns as a list of tasks and give to domian layer
    return tasks.map((taskIsar) => taskIsar.toDomain()).toList();
  }

  // add a task
  @override
  Future<void> addTask(Task task) async {
    // converts Task obj to an Isar obj
    final taskIsar = TaskIsar.fromDomain(task);

    // adds Isar obj to the db
    return db.writeTxn(() => db.taskIsars.put(taskIsar));
  }

  // update a task
  @override
  Future<void> updateTask(Task task) async {
    // converts Task obj to an Isar obj
    final taskIsar = TaskIsar.fromDomain(task);

    // updates Isar obj in the db
    return db.writeTxn(() => db.taskIsars.put(taskIsar));
  }

  // delete a task
  @override
  Future<void> deleteTask(Task task) async {
    // removes Isar obj from the db
    await db.writeTxn(() => db.taskIsars.delete(task.id));
  }
}
