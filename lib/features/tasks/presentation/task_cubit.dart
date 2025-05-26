/*

TASK CUBIT
simple state managment

each cubit is a list of tasks

*/

import 'package:flowscape/features/tasks/domain/task_domain_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<List<Task>> {
  final TaskRepo taskRepo;

  // constructor: initial state = empty list []
  TaskCubit(this.taskRepo) : super([]) {
    loadTasks();
  }

  // load
  Future<void> loadTasks() async {
    // fetch tasks from repo
    final tasksList = await taskRepo.getAllTasks();

    // emit as new state
    emit(List<Task>.from(tasksList));
  }

  // add
  Future<void> addTask(String text) async {
    // create new task with uniqe ID
    Task newTask = Task(id: 0, text: text);

    // save new task to the repo
    await taskRepo.addTask(newTask);

    // reload the repo
    await loadTasks();
  }

  // delete
  Future<void> deleteTask(Task task) async {
    // delete the task from repo
    await taskRepo.deleteTask(task);

    // reload the repo
    await loadTasks();
  }

  // toggle [isComplete] state
  Future<void> toggleTask(Task task) async {
    // toggles the [isComplete] state
    final updatedTask = task.toggleCompleteState();

    // update the task in the repo
    await taskRepo.updateTask(updatedTask);

    // reload the repo
    await loadTasks();
  }
}
