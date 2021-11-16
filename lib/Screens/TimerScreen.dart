import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

const Duration workTime = Duration(minutes: 25);
const Duration shortBreakTime = Duration(minutes: 5);
const Duration longBreakTime = Duration(minutes: 15);
const int longBreakAfter = 3;
const int targetInterval = 6;

enum Status {
  work,
  shortBreak,
  longBreak,
}

class Pomodoro {
  Pomodoro({
    this.time,
    this.status,
    this.count,
  });

  Duration time;
  Status status;
  int count;

  void setParam({Duration time, Status status}) {
    this.time = time;
    this.status = status;
  }
}

class timerScreen extends StatefulWidget {
  @override
  _timerScreenState createState() => _timerScreenState();
}

class _timerScreenState extends State<timerScreen> {
  Stopwatch _sw;
  Timer _timer;
  Duration _timeLeft = const Duration();

  final Pomodoro _pomodoro = Pomodoro(
    time: workTime,
    status: Status.work,
    count: 0,
  );

  @override
  void initState() {
    _pomodoro.time = workTime;
    _sw = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 50), _callback);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _callback(Timer timer) {
    if (_sw.elapsed > _pomodoro.time) {
      setState(() {
        _changeNextStatus();
      });
      return;
    }

    final Duration _newTimeLeft = _pomodoro.time - _sw.elapsed;
    if (_newTimeLeft.inSeconds != _timeLeft.inSeconds) {
      setState(() {
        _timeLeft = _newTimeLeft;
      });
    }
  }

  void _changeNextStatus() {
    _sw.stop();
    _sw.reset();
    if (_pomodoro.status == Status.work) {
      _pomodoro.count++;
      if (_pomodoro.count % longBreakAfter == 0) {
        _pomodoro.setParam(time: longBreakTime, status: Status.longBreak);
      } else {
        _pomodoro.setParam(time: shortBreakTime, status: Status.shortBreak);
      }
    } else {
      _pomodoro.setParam(time: workTime, status: Status.work);
    }
  }

  Widget displayTimeString() {
    final String minutes =
        (_timeLeft.inMinutes % 60).toString().padLeft(2, '0');
    final String seconds =
        (_timeLeft.inSeconds % 60).toString().padLeft(2, '0');
    return Text('$minutes:$seconds',
        style: const TextStyle(fontSize: 70.0, color: Colors.red));
  }

  Widget displayPomodoroStatus() {
    String text;
    if (_pomodoro.status == Status.work) {
      text = 'Work';
    } else if (_pomodoro.status == Status.shortBreak) {
      text = 'Short Break';
    } else {
      text = 'Long Break';
    }
    return Text(text, style: const TextStyle(fontSize: 30.0));
  }

  Color _getColor() {
    if (_pomodoro.status == Status.work) {
      return Colors.blue;
    } else if (_pomodoro.status == Status.shortBreak) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[displayPomodoroStatus(), Container()]);
  }
}
