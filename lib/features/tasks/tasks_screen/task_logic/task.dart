import 'dart:io';
import '../../../../core/helpers/write_to_json.dart';

class Task {
  /// A unique id for each task, an id starts with a "#" and then with a letter and a "-"
  /// and followed by a number
  final String id;
  final String? name;
  final String? description;
  final String? dueDate;
  bool isCompleted;
  bool isMissed;

  Task(
    this.id, {
    this.name = '',
    this.description = '',
    this.dueDate = '',
    this.isCompleted = false,
    this.isMissed = false,
  });

  /// Saves the task to a local file. The file is located in the lib/core/data directory
  /// The file name is tasks.json. The key param is the key in the json
  /// the key param can be "daily" | "weekly" | "custom"
  void save(dynamic key) {
    writeToJSON(
      file: File("lib/core/data/tasks.json"),
      func: (dynamic decodedJson) => _addToJSONLogic(key, decodedJson),
    );
  }

  void _addToJSONLogic(dynamic key, dynamic decodedJson) {
    if (decodedJson is Map<String, dynamic> && decodedJson.containsKey(key)) {
      final taskList = decodedJson[key];
      final idStr = id.toString();

      void taskListATLIE(String section) => _addToListIfExists(taskList[section], idStr);

      if (isCompleted) {
        taskListATLIE("completed");
      } else if (isMissed) {
        taskListATLIE("missed");
      } else {
        taskListATLIE("onGoing");
      }
    }
  }

  void _addToListIfExists(List? list, dynamic value) {
    if (list != null && !list.contains(value)) {
      list.add(value);
    }
  }

  String info() {
    return 'Id: $id, Task: $name, Description: $description, Due Date: $dueDate, Completed: $isCompleted';
  }
}
