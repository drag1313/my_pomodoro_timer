import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/Screens/CalendarScreen.dart';
import 'package:flutter_pomodoro_timer/Screens/SettingsScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';

const Duration workTime = Duration(minutes: 1);
const Duration shortBreakTime = Duration(minutes: 1);
const Duration longBreakTime = Duration(minutes: 1);
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

class TimerScreen extends StatefulWidget {
  @override
  _timerScreenState createState() => _timerScreenState();
}

class _timerScreenState extends State<TimerScreen> {
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
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('0/3 Pomodoro',
                style: const TextStyle(fontSize: 20.0, color: Colors.red))),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Text('$minutes:$seconds',
              style: const TextStyle(fontSize: 70.0, color: Colors.red)),
        )
      ],
    );
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
      children: <Widget>[
        // displayPomodoroStatus(),
        Container(
            decoration: new BoxDecoration(
                //  boxShadow: [
                //    new BoxShadow() //тень для индикатора
                //   ],
                ),
            child: CircularPercentIndicator(
              radius: 250.0,
              lineWidth: 20.0,
              percent: _timeLeft.inSeconds / _pomodoro.time.inSeconds,
              center: displayTimeString(),
              progressColor: Colors.red,
            )),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: Colors.red, size: 40),
            Text(
              '${_pomodoro.count.toString()}',
              style: const TextStyle(fontSize: 40.0),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 80,
                width: 380,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(10.0, 5.0),
                        blurRadius: 20.0,
                        spreadRadius: 5.0)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: const CircleBorder(),
                      ),
                      child: IconButton(
                          icon: Icon(Icons
                              .calendar_today_sharp), //Icon(_sw.isRunning ? null : Icons.refresh),
                          color: Colors.red,
                          iconSize: 42,
                          onPressed: () {
                            // _resetButtonPressed();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => calendarScreen()));
                          }),
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: const CircleBorder(),
                      ),
                      child: IconButton(
                        //  icon: Icon(Icons.play_arrow),
                        icon: Icon(
                            _sw.isRunning ? Icons.pause : Icons.play_arrow),
                        color: Colors.red,
                        iconSize: 42,
                        onPressed: () => _buttonPressed(),
                      ),
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: const CircleBorder(),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.settings),
                          // icon: Icon(_sw.isRunning ? Icons.pause : Icons.play_arrow),
                          color: Colors.red,
                          iconSize: 42,
                          onPressed: () {
                            // _buttonPressed();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => settingsScreen()));
                          }),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }

  void _resetButtonPressed() {
    if (!_sw.isRunning) {
      setState(() {
        _sw.reset();
      });
    }
  }

  void _buttonPressed() {
    setState(() {
      if (_sw.isRunning) {
        _sw.stop();
      } else {
        _sw.start();
      }
    });
  }
}
