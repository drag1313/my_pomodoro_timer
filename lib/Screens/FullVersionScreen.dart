import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class fullVersionScreen extends StatefulWidget {
  @override
  fullVersionScreenState createState() => fullVersionScreenState();
}

class fullVersionScreenState extends State<fullVersionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Full Version'),
          Text('Remove Ads'),
        ],
      ),
    ));
  }
}
