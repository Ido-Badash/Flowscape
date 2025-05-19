import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

/// The func param takes a dynamic decodedJson
void writeToJSON({required File file, required void Function(dynamic decodedJson) func}) async {
  try {
    final file = File("lib/core/data/tasks.json");
    final jsonString = await file.readAsString();
    final decodedJson = jsonDecode(jsonString);

    func(decodedJson);

    debugPrint('Modified JSON data: $decodedJson');

    final updatedJsonString = jsonEncode(decodedJson);
    await file.writeAsString(updatedJsonString);

    debugPrint('Task saved to JSON file.');
  } catch (e) {
    debugPrint('Error saving task in json file: $e');
  }
}
