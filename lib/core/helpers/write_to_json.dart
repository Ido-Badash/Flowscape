import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

/// The jsonChange param takes a dynamic decodedJson
void writeToJSON({required File file, required dynamic Function(dynamic decodedJson) jsonChange}) async {
  try {
    final file = File("lib/core/data/tasks.json");
    final jsonString = await file.readAsString();
    dynamic decodedJson = jsonDecode(jsonString);

    decodedJson = jsonChange(decodedJson);

    debugPrint('Modified JSON data: $decodedJson');

    final encodedJson = jsonEncode(decodedJson);
    await file.writeAsString(encodedJson);

    debugPrint('Task saved to JSON file.');
  } catch (e, stackTrace) {
    debugPrint('Error saving task in json file: $e');
    debugPrint('Stack trace: $stackTrace');
  }
}
