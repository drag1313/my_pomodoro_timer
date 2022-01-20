import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pomodoro_timer/Screens/ButtonsPanel.dart';
import 'package:flutter_pomodoro_timer/Screens/FullVersionScreen.dart';

class settingsScreen extends StatefulWidget {
  @override
  settingsScreenState createState() => settingsScreenState();
}

class timersData {
  int LongBreak = 5;
  int PomodoroCount = 7;
  int ShortBreak = 9;
  int WorkTime = 4;
  int SprintCount = 20;
}

class settingsScreenState extends State<settingsScreen> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Center(
                child: Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height,
                    margin: EdgeInsets.only(top: 25, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // Red border with the width is equal to 5
                              border: Border(
                                bottom: BorderSide(width: 2, color: Colors.red),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pomodoro',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red)),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tight(const Size(30, 40)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration.collapsed(hintText: ""),

                                  onChanged: (text) => timersData()
                                      .PomodoroCount = int.parse(text),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // Red border with the width is equal to 5
                              border: Border(
                                bottom: BorderSide(width: 2, color: Colors.red),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Short Break',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red)),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tight(const Size(30, 40)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration.collapsed(hintText: ""),
                                  onChanged: (text) =>
                                      timersData().ShortBreak = int.parse(text),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // Red border with the width is equal to 5
                              border: Border(
                                bottom: BorderSide(width: 2, color: Colors.red),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Long Break',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red)),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tight(const Size(30, 40)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration.collapsed(hintText: ""),
                                  onChanged: (text) =>
                                      timersData().LongBreak = int.parse(text),
                                  onSaved: (String? inValue) {
                                    timersData().LongBreak =
                                        int.parse(inValue!);
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // Red border with the width is equal to 5
                              border: Border(
                                bottom: BorderSide(width: 2, color: Colors.red),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sprint',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red)),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tight(const Size(30, 40)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration.collapsed(hintText: ""),
                                  onChanged: (text) => timersData()
                                      .SprintCount = int.parse(text),
                                  onSaved: (String? inValue) {
                                    timersData().WorkTime = int.parse(inValue!);
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Language',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red)),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(150, 50)),
                              child: DropdownButton<String>(
                                items: [
                                  DropdownMenuItem<String>(
                                    child: Text('English'),
                                    value: 'one',
                                  ),
                                  DropdownMenuItem<String>(
                                    child: Text('Russian'),
                                    value: 'two',
                                  ),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                                hint: Text('Select Language'),
                                value: _value,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 75,
                            width: 330,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              fullVersionScreen()));
                                },
                                child: Text('Tired of advertising?',
                                    style: TextStyle(fontSize: 15)))),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(50.0)),
                            ),
                            height: 75,
                            width: 330,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              fullVersionScreen()));
                                },
                                child: Text('Buy Full Version',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)))),
                        Container(
                          margin: EdgeInsets.only(top: 110),
                          child: buttonsPanel(),
                        )
                      ],
                    )))));
  }
}
