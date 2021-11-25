import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                child: Container(
                    margin: EdgeInsets.only(
                        top: 50, left: 30, right: 30, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pomodoro',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red)),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(30, 50)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Short Break',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red)),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(30, 50)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Long Break',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red)),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(30, 50)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sprint',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red)),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(30, 50)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Language',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red)),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(30, 50)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ], // Only numbers can be entered
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
                      ],
                    )))));
  }
}
