/*
DATABASE REPO 
Handles data storage from task repo
*/

import '../models/tasks_models_lib.dart';
import '../../domain/task_domain_lib.dart';
import 'package:isar/isar.dart';
import 'package:flutter/foundation.dart';

class IsarTaskRepo implements TaskRepo {
  // database
  final Isar db;
  IsarTaskRepo(this.db);

  // get all tasks
  @override
  Future<List<Task>> getAllTasks() async {
    final tasks = await db.taskIsars.where().findAll();
    // Debug print to verify loaded tasks
    debugPrint('Loaded from Isar: ${tasks.map((t) => t.text).toList()}');
    return tasks.map((taskIsar) => taskIsar.toDomain()).toList();
  }

  // add a task
  @override
  Future<void> addTask(Task task) async {
    final taskIsar = TaskIsar.fromDomain(task);
    // Let Isar assign the ID if needed (set id = 0 or null in TaskIsar)
    taskIsar.id = Isar.autoIncrement;
    await db.writeTxn(() => db.taskIsars.put(taskIsar));
  }

  // update a task
  @override
  Future<void> updateTask(Task task) async {
    final taskIsar = TaskIsar.fromDomain(task);
    await db.writeTxn(() => db.taskIsars.put(taskIsar));
  }

  // delete a task
  @override
  Future<void> deleteTask(Task task) async {
    await db.writeTxn(() => db.taskIsars.delete(task.id));
  }
}
