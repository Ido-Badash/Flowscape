import 'task.dart';

/// The brain of a tasks widget
class Tasker {
  final String? name;

  Tasker({this.name});

  List<Task> tasks = [];

  void add(Task task) {
    tasks.add(task);
  }

  void remove(Task task) {
    tasks.remove(task);
  }

  void removeWithIdx(int idx) {
    tasks.remove(tasks[idx]);
  }

  int idxLoc(Task task) {
    return tasks.indexOf(task);
  }

  /// Saves the tasks to a local file
  /// The file is located in the lib/core/data directory
  /// The file name is tasks.json
  void save() {
    for (int i = 0; i < tasks.length; i++) {
      Task task = tasks[i];
      String id = task.id;
      if (id.startsWith("#d-")) {
        task.save("daily");
      } else if (id.startsWith("#w-")) {
        task.save("weekly");
      } else {
        task.save("custom");
      }
    }
  }
}
