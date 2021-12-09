import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/Screens/CalendarScreen.dart';
import 'package:flutter_pomodoro_timer/Screens/SettingsScreen.dart';
import 'package:flutter_pomodoro_timer/Screens/TimerScreen.dart';

class buttonsPanel extends StatefulWidget {
  @override
  buttonsPanelState createState() => buttonsPanelState();
}

class buttonsPanelState extends State<buttonsPanel> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 80,
            width: screenSize.width * 0.8,
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              color: Colors.white,
              /* boxShadow: [
                new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(10.0, 5.0),
                    blurRadius: 20.0,
                    spreadRadius: 5.0)
              ],*/
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
                      icon: Icon(Icons
                          .calendar_today_sharp), //Icon(_sw.isRunning ? null : Icons.refresh),
                      color: Colors.grey,
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
                    color: Colors.grey,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.grey,
                    iconSize: 42,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimerScreen()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => settingsScreen()));
                      }),
                ),
              ],
            )),
      ],
    );
  }
}
 
 
 
 
 
 
 
 
 
 
 
 /*Row(
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
                                        builder: (context) =>
                                            calendarScreen()));
                              }),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: Colors.red,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.red,
                            iconSize: 42,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimerScreen()));
                            },
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: Colors.red,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                              icon: Icon(Icons.settings),
                              color: Colors.red,
                              iconSize: 42,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            settingsScreen()));
                              }),
                        ),
                      ],
                    )),
              ],
            ),*/