import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flow_timer_controller.dart';

class FlowTimer extends StatelessWidget {
  const FlowTimer({super.key});

  // Format duration as mm:ss
  String _format(Duration d) =>
      "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<FlowTimerController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimerCircle(timer),
        const SizedBox(height: 50),
        _buildModeLabel(timer),
        const SizedBox(height: 20),
        _buildControlButtons(timer),
      ],
    );
  }

  // Timer display circle
  Widget _buildTimerCircle(FlowTimerController timer) {
    return Container(
      width: 150,
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white12, width: 3),
      ),
      child: Text(
        _format(timer.time),
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }

  // Label for current mode (focus/break)
  Widget _buildModeLabel(FlowTimerController timer) {
    return Text(
      timer.mode == FlowTimerMode.onFocus ? "focus" : "take a break",
      style: const TextStyle(fontSize: 14, color: Colors.white54),
    );
  }

  // Row of control buttons: Start/Stop, Skip, Reset
  Widget _buildControlButtons(FlowTimerController timer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStartStopButton(timer),
        const SizedBox(width: 10),
        _buildSkipButton(timer),
        const SizedBox(width: 10),
        _buildResetButton(timer),
      ],
    );
  }

  Widget _buildStartStopButton(FlowTimerController timer) {
    return ElevatedButton(
      onPressed: timer.isRunning ? timer.stop : timer.start,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.white12, width: 2),
        ),
      ),
      child: Text(
        timer.isRunning ? "Stop" : "Start",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildSkipButton(FlowTimerController timer) {
    return ElevatedButton(
      onPressed: timer.skip,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.white12, width: 2),
        ),
      ),
      child: const Text(
        "Skip",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildResetButton(FlowTimerController timer) {
    return ElevatedButton(
      onPressed: timer.reset,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.white12, width: 2),
        ),
      ),
      child: const Text(
        "Reset",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }
}
