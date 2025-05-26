/*

TASK REPO

here is the task repo the defines what the app can do with the task object

*/

import 'package:flowscape/features/tasks/domain/models/task_model.dart';

abstract class TaskRepo {
  /// Gets a list of all the tasks
  Future<List<Task>> getAllTasks();

  /// Adds a new task to the list
  Future<void> addTask(Task task);

  /// Updates an existing task
  Future<void> updateTask(Task task);

  /// Deletes a task from the list
  Future<void> deleteTask(Task task);
}

/*

The TaskRepo in the domain layer defines the methods that are used on the db at its core

*/