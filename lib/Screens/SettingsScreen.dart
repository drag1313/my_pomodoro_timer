import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pomodoro_timer/Screens/ButtonsPanel.dart';
import 'package:flutter_pomodoro_timer/Screens/FullVersionScreen.dart';

class settingsScreen extends StatefulWidget {
  @override
  settingsScreenState createState() => settingsScreenState();
}

class settingsScreenState extends State<settingsScreen> {
  int LongBreak;
  int PomodoroCount;
  int ShortBreak;
  int SprintCount;
  String _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: SafeArea(
                child: Center(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: 50, left: 30, right: 30, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // Red border with the width is equal to 5
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: Colors.red[100]),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Pomodoro',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.red)),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.tight(
                                        const Size(30, 40)),
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: ""),

                                      onChanged: (text) =>
                                          PomodoroCount = int.parse(text),
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
                                    bottom: BorderSide(
                                        width: 2, color: Colors.red[100]),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Short Break',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.red)),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.tight(
                                        const Size(30, 40)),
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: ""),
                                      onChanged: (text) =>
                                          ShortBreak = int.parse(text),
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
                                    bottom: BorderSide(
                                        width: 2, color: Colors.red[100]),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Long Break',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.red)),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.tight(
                                        const Size(30, 40)),
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: ""),
                                      onChanged: (text) =>
                                          LongBreak = int.parse(text),
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
                                    bottom: BorderSide(
                                        width: 2, color: Colors.red[100]),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sprint',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.red)),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.tight(
                                        const Size(30, 40)),
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: ""),
                                      onChanged: (text) =>
                                          SprintCount = int.parse(text),
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
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.red)),
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
                                    onChanged: (String value) {
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
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(50.0)),
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
                                            color: Colors.white,
                                            fontSize: 20)))),
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              child: buttonsPanel(),
                            )
                          ],
                        ))))));
  }
}
