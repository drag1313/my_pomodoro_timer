import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pomodoro_timer/Screens/CalendarScreen.dart';
import 'package:flutter_pomodoro_timer/Screens/FullVersionScreen.dart';
import 'package:flutter_pomodoro_timer/Screens/SettingsScreen.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_pomodoro_timer/bloc/bloc/timer_bloc.dart';

CountDownController _controller = CountDownController();

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TimerBloc _bloc = new TimerBloc();
    var screenSize = MediaQuery.of(context).size;
    var myWidth = MediaQuery.of(context).size.width / 2;
    var myHeight = MediaQuery.of(context).size.height / 2;

    CircularCountDownTimer myWorkTimer = new CircularCountDownTimer(
      width: myWidth,
      height: myHeight,
      duration: _bloc.durationTime,
      fillColor: Colors.purpleAccent[100]!,
      ringColor: Colors.grey[300]!,
      strokeWidth: 20.0,
      controller: _controller,
      ringGradient: null,
      fillGradient: null,
      backgroundColor: Colors.purple[500],
      backgroundGradient: null,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.MM_SS,
      isReverseAnimation: true,
      isReverse: true,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {},
      onComplete: () {},
    );
    return Scaffold(
        body: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is TimerInitialState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Center(
                          child: // _bloc.WorkTimeCounter == 0
                              Container(child: myWorkTimer)
                          // : Container(child: myLongBreakTimer)

                          /* CircularCountDownTimer(
              // Countdown duration in Seconds.

              duration: duration = DataTimers().WorkTime,

              // Countdown initial elapsed Duration in Seconds.
              initialDuration: 0,

              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: _controller,

              // Width of the Countdown Widget.
              width: MediaQuery.of(context).size.width / 2,

              // Height of the Countdown Widget.
              height: MediaQuery.of(context).size.height / 2,

              // Ring Color for Countdown Widget.
              ringColor: Colors.grey[300]!,

              // Ring Gradient for Countdown Widget.
              ringGradient: null,

              // Filling Color for Countdown Widget.
              fillColor: Colors.purpleAccent[100]!,

              // Filling Gradient for Countdown Widget.
              fillGradient: null,

              // Background Color for Countdown Widget.
              backgroundColor: Colors.purple[500],

              // Background Gradient for Countdown Widget.
              backgroundGradient: null,

              // Border Thickness of the Countdown Ring.
              strokeWidth: 20.0,

              // Begin and end contours with a flat edge and no extension.
              strokeCap: StrokeCap.round,

              // Text Style for Countdown Text.
              textStyle: TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),

              // Format for the Countdown Text.
              textFormat: CountdownTextFormat.MM_SS,

              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: true,

              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: true,

              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,

              // Handles the timer start.
              autoStart: false,

              // This Callback will execute when the Countdown Starts.
              onStart: () {},

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                setState(() {
                  if (DataTimers().PomodoroCount < 10) {
                    _controller.start();
                  }
                  ;
                  DataTimers().WorkTimeCounter++;
                  if (DataTimers().WorkTimeCounter < 2) {
                    DataTimers().WorkTimeCounter++;
                    duration = DataTimers().WorkTime;
                  } else {
                    if (DataTimers().WorkTimeCounter == 2) {
                      duration = DataTimers().LongBreak;
                      DataTimers().WorkTimeCounter++;
                    } else {
                      if (DataTimers().WorkTimeCounter == 3) {
                        duration = DataTimers().WorkTime;
                        DataTimers().PomodoroCount++;
                        DataTimers().WorkTimeCounter = 0;
                      }
                    }
                  }
                  ;
                });
              },
            )*/
                          ),
                    ),
                    Container(
                      decoration: new BoxDecoration(),
                    ),
                    Column(
                      children: [
                        _bloc.isPausePress
                            ? GestureDetector(
                                onTap: () {
                                  _bloc.add(PauseEvent());
                                  if (!_bloc.isPausePress) {
                                    _controller.pause();
                                    _bloc.isPausePress = true;
                                  } else {
                                    _controller.resume();
                                    _bloc.isPausePress = false;
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 50,
                                  width: screenSize.width * 0.45,
                                  decoration: new BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: Colors.red),
                                    borderRadius: new BorderRadius.all(
                                      new Radius.circular(7.0),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                      child: (state is PauseState)
                                          ? Text('RESUME',
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.red))
                                          : Text('PAUSE',
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.red))),
                                ),
                              )
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${_bloc.PomodoroCount.toString()}',
                              style: const TextStyle(
                                  fontSize: 25.0, color: Colors.red),
                            ),
                            Icon(Icons.circle, color: Colors.red, size: 25),
                          ],
                        ),
                        Text('this session',
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 80,
                            width: 380,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: const CircleBorder(),
                                  ),
                                  child: IconButton(
                                      icon: Icon(Icons.calendar_today_sharp),
                                      color: Colors.grey,
                                      iconSize: 42,
                                      onPressed: () {
                                        _bloc.add(CalendarEvent());
                                        /* Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    calendarScreen()));*/
                                      }),
                                ),
                                Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: const CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: Icon(_bloc.isPause
                                        ? Icons.stop
                                        : Icons.play_arrow),
                                    color: Colors.grey,
                                    iconSize: 42,
                                    onPressed: () {
                                      _controller.start();
                                      if (_bloc.isPause) {
                                      } else {
                                        _bloc.isPause = !_bloc.isPause;
                                      }
                                    },
                                  ),
                                ),
                                Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: const CircleBorder(),
                                  ),
                                  child: IconButton(
                                      icon: Icon(Icons.settings),
                                      color: Colors.grey,
                                      iconSize: 42,
                                      onPressed: () {
                                        _bloc.add(SettingsEvent());
                                        /*  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    settingsScreen()));*/
                                      }),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                );
              }
              if (state is CalendarState) {
                return Container(
                  child: calendarScreen(),
                );
              }
              if (state is SettingsScreenState) {
                return Container(
                  child: settingsScreen(),
                );
              }
              if (state is FullVersionScreenState) {
                return Container(
                  child: fullVersionScreen(),
                );
              }

              return Container(child: Center(child: Text('ERROR')));
            }));
  }
}
