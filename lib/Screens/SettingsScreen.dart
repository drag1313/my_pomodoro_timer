import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pomodoro_timer/Screens/FullVersionScreen.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:numberpicker/numberpicker.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Pomodoro', style: TextStyle(fontSize: 25, color: Colors.red)),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(30, 50)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ], // Only numbers can be entered
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Short Break',
                style: TextStyle(fontSize: 25, color: Colors.red)),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(30, 50)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ], // Only numbers can be entered
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Long Break',
                style: TextStyle(fontSize: 25, color: Colors.red)),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(30, 50)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ], // Only numbers can be entered
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Sprint', style: TextStyle(fontSize: 25, color: Colors.red)),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(30, 50)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ], // Only numbers can be entered
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Language', style: TextStyle(fontSize: 25, color: Colors.red)),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(30, 50)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ], // Only numbers can be entered
              ),
            ),
          ],
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
