import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  Duration duration = Duration();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: buildTime(),),
    );
  }

  buildTime() {
    return Text(
      '${duration.inSeconds}',
      style: TextStyle(fontSize: 80),
    );
  }
}
