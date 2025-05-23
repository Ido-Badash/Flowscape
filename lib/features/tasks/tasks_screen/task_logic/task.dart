import 'dart:io';
import '../../../../core/helpers/write_to_json.dart';

class Task {
  final String id;
  final String key;
  final String? name;
  final String? description;
  final String? dueDate;
  bool isCompleted;
  bool isMissed;

  /// A unique id for each task, an id starts with a "#"
  /// and followed by a number
  Task(
    this.id,
    this.key, {
    this.name = '',
    this.description = '',
    this.dueDate = '',
    this.isCompleted = false,
    this.isMissed = false,
  });

  // TODO: dupes when isCompleted or isMissed set to a diffrent value in the json file

  /// Saves the task to a local file. The file is located in the lib/core/data directory
  /// The file name is tasks.json. The key param is the key in the json
  /// the key param can be "daily" | "weekly" | "custom"
  void save() {
    writeToJSON(
      file: File("lib/core/data/tasks.json"),
      jsonChange: (dynamic decodedJson) => _addToJSONLogic(decodedJson),
    );
  }

  dynamic _addToJSONLogic(dynamic decodedJson) {
    if (decodedJson is Map<String, dynamic> && decodedJson.containsKey(key)) {
      final idStr = id.toString();

      // decodedJson = stores all the keys
      // key = ["custom", "daily", "weekly"]
      // section = ["onGoing", "completed", "missed"]
      // value = the task itself

      void saveToSection(String section) {
        _removeValueInJson(decodedJson, idStr);
        decodedJson[key][section].add(idStr);
      }

      if (isCompleted) {
        saveToSection("completed");
      } else if (isMissed) {
        saveToSection("missed");
      } else {
        saveToSection("onGoing");
      }
    }
    return decodedJson;
  }

  void _removeValueInJson(Map<String, dynamic> decodedJson, dynamic value) {
    // decodedJson must be Map<String, Map<String, List>> here
    try {
      decodedJson.forEach((outerKey, outerValue) { // for {"d", "w", "c"}
        if (outerValue is Map<String, dynamic>) {
          outerValue.forEach((innerKey, innerValue) { // for {"onGoing", "completed", "missed"}
            if (innerValue is List) {
              innerValue.remove(value); // removes the task from the list
            }
          });
        }
      });
    } catch (e) {
      if ((decodedJson is! Map<String, Map<String, List>>)) {
        throw Exception('decodedJson is not a Map<String, Map<String, List>>');
      }
    }
  }

  String info() {
    return 'Id: $id, Task: $name, Description: $description, Due Date: $dueDate, Completed: $isCompleted';
  }
}
