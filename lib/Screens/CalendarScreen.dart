import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
      child: Text('Calendar'),
    ))));
  }
}
