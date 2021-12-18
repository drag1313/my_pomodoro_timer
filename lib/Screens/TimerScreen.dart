import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/Screens/CalendarScreen.dart';
import 'package:flutter_pomodoro_timer/Screens/SettingsScreen.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

bool isPause = false;
int _duration = 10;
CountDownController _controller = CountDownController();

class TimerScreen extends StatefulWidget {
  @override
  _timerScreenState createState() => _timerScreenState();
}

class _timerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var count = 5;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Center(
                child: CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: _duration,

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
              textFormat: CountdownTextFormat.S,

              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: false,

              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: false,

              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,

              // Handles the timer start.
              autoStart: false,

              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want
                print('Countdown Started');
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                // Here, do whatever you want
                print('Countdown Ended');
              },
            )),
            /*  floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(title: "Start", onPressed: () => _controller.start()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Pause", onPressed: () => _controller.pause()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Resume", onPressed: () => _controller.resume()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: _duration))
        ],
      ),*/
          ),
          // displayPomodoroStatus(),
          Container(
            decoration: new BoxDecoration(
                //  boxShadow: [
                //    new BoxShadow() //тень для индикатора
                //   ],
                ),
            /*  child: CircularPercentIndicator(
                radius: 250.0,
                lineWidth: 20.0,
                percent: _timeLeft.inSeconds / _pomodoro.time.inSeconds,
                center: displayTimeString(),
                progressColor: Colors.red,
              )*/
          ),
          Column(
            children: [
              isPause
                  ? GestureDetector(
                      onTap: () {
                        _controller.pause();
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 50,
                        width: screenSize.width * 0.45,
                        decoration: new BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red),
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(7.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text('PAUSE',
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.red)),
                        ),
                      ),
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${count.toString()}',
                    style: const TextStyle(fontSize: 25.0),
                  ),
                  Icon(Icons.circle, color: Colors.red, size: 25),
                ],
              ),
              Text('this session',
                  style: const TextStyle(fontSize: 20.0, color: Colors.grey)),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 80,
                  width: 380,
                  decoration: new BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
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
                          icon: Icon(Icons.play_arrow),
                          color: Colors.red,
                          iconSize: 42,
                          onPressed: () => {_controller.start()},
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
      ),
    );
  }
}
