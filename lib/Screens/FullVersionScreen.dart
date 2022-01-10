import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/Screens/ButtonsPanel.dart';

class fullVersionScreen extends StatefulWidget {
  @override
  fullVersionScreenState createState() => fullVersionScreenState();
}

class fullVersionScreenState extends State<fullVersionScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Text(
                'Full Version',
                style: TextStyle(color: Colors.red, fontSize: 55),
              ),
            ),
            Container(
                child: Text(
              'Remove Ads',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(new Radius.circular(50.0)),
                ),
                height: 75,
                width: screenSize.width * 0.8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      /*dart pub upgrade --null-safety Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => altTimerScreen()));*/
                    },
                    child: Text('Buy Full Version',
                        style: TextStyle(color: Colors.white, fontSize: 20)))),
            Container(child: Text('Tertms of Service and Privacy Policy ')),
            Container(
                height: 200,
                width: screenSize.width * 0.7,
                child: Text(
                  'Отменить подписку можно в разделе\n"Настройки" Apple Id в любой момент,\n но не менее чем за день до даты возобновления. \n Подписка будет возобновляться автоматически, \n пока Вы ее не отмените.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                )),
            Container(
              width: screenSize.width * 0.8,
              margin: EdgeInsets.only(bottom: 40),
              child: buttonsPanel(),
            )
          ],
        ),
      ],
    ))));
  }
}
