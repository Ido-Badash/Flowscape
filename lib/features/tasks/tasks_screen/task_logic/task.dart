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

  // TODO: dupes when isCompleted or isMissed set to a diffrent value in the json file

  /// Saves the task to a local file. The file is located in the lib/core/data directory
  /// The file name is tasks.json. The key param is the key in the json
  /// the key param can be "daily" | "weekly" | "custom"
  void save(dynamic key) {
    writeToJSON(
      file: File("lib/core/data/tasks.json"),
      jsonChange: (dynamic decodedJson) => _addToJSONLogic(key, decodedJson),
    );
  }

  dynamic _addToJSONLogic(dynamic key, dynamic decodedJson) {
    if (decodedJson is Map<String, dynamic> && decodedJson.containsKey(key)) {
      final idStr = id.toString();

      // decodedJson = stores all the keys
      // key = ["custom", "daily", "weekly"]
      // section = ["onGoing", "completed", "missed"]
      // value = the task itself

      void saveToSection(String section) {
        if (_taskNullAndDupeCheck(decodedJson, key, section, idStr)) {
          decodedJson[key][section].add(idStr);
        }
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

  bool _ifTaskExists(
    Map<String, dynamic> decodedJson,
    String key,
    String section,
    dynamic value,
  ) {
    // Check if the section exists and is a list
    if (decodedJson[key][section] is List) {
      return decodedJson[key][section].contains(value);
    }
    return false;
  }

  bool _taskNullAndDupeCheck(
    Map<String, dynamic> decodedJson,
    String key,
    String section,
    dynamic value,
  ) {
    // Check if section exists and value is not already present
    if (decodedJson[key] != null &&
        decodedJson[key][section] != null &&
        !decodedJson[key][section].contains(value)) {
      return true;
    }
    return false;
  }

  String info() {
    return 'Id: $id, Task: $name, Description: $description, Due Date: $dueDate, Completed: $isCompleted';
  }
}
