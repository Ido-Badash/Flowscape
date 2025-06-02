import 'dart:async';
import 'package:flutter/material.dart';

enum FlowTimerMode { onFocus, onBreak }

class FlowTimerController extends ChangeNotifier {
  final Duration focusDuration;
  final Duration breakDuration;
  FlowTimerMode _mode = FlowTimerMode.onFocus;
  Duration _time;
  Timer? _timer;
  bool _isRunning = false;

  FlowTimerController({
    this.focusDuration = const Duration(minutes: 25),
    this.breakDuration = const Duration(minutes: 5),
  }) : _time = focusDuration;

  FlowTimerMode get mode => _mode;
  Duration get time => _time;
  bool get isRunning => _isRunning;

  void start() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time > Duration.zero) {
        _time -= const Duration(seconds: 1);
        notifyListeners();
      } else {
        _timer?.cancel();
        _isRunning = false;
        if (_mode == FlowTimerMode.onFocus) {
          _resetToBreak();
          start();
        } else {
          _resetToFocus();
          start();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void reset() {
    if (_mode == FlowTimerMode.onFocus) {
      _resetToFocus();
    } else {
      _resetToBreak();
    }
    notifyListeners();
  }

  void skip() {
    if (_mode == FlowTimerMode.onFocus) {
      _resetToBreak();
    } else {
      _resetToFocus();
    }
    notifyListeners();
  }

  void _resetToFocus() {
    _mode = FlowTimerMode.onFocus;
    _time = focusDuration;
    _isRunning = false;
    _timer?.cancel();
  }

  void _resetToBreak() {
    _mode = FlowTimerMode.onBreak;
    _time = breakDuration;
    _isRunning = false;
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
