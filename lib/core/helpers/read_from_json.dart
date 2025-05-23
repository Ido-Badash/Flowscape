import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

dynamic readFromJSON({required File file}) async {
  try {
    final jsonString = await file.readAsString();
    dynamic decodedJson = jsonDecode(jsonString);
    return decodedJson;
  } catch (e, stackTrace) {
    debugPrint('Error reading JSON file: $e');
    debugPrint('Stack trace: $stackTrace');
    return null;
  }
}