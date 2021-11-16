import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/Screens/TimerScreen.dart';

void main() => runApp(BaseApp());

class BaseApp extends StatefulWidget {
  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: Scaffold(
          body: SafeArea(
            child: TimerScreen(),
          ),
        ),
      );
}
