import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/Screens/FullVersionScreen.dart';

class settingsScreen extends StatefulWidget {
  @override
  settingsScreenState createState() => settingsScreenState();
}

class settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('Экран Настроек'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => fullVersionScreen()));
            },
            child: Text('Buy Full Version', style: TextStyle(fontSize: 15))),
      ],
    ))));
  }
}
