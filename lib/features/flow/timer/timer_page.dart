/*

TIMER PAGE
builds the timer page where the timer widget is
and all the actions
this page will be built on the FlowScreen

*/

// imports
import 'package:flowscape/features/flow/timer/flow_timer.dart';
import 'package:flutter/material.dart';

// TimerPage
class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowTimer();
  }
}
