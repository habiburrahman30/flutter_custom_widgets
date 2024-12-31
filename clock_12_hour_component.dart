import 'dart:async';

import 'package:flutter/material.dart';

class Clock12HourComponent extends StatefulWidget {
  @override
  State<Clock12HourComponent> createState() => _Clock12HourComponentState();
}

class _Clock12HourComponentState extends State<Clock12HourComponent> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startClock();
  }

  void _startClock() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String amPm = _currentTime.hour >= 12 ? "PM" : "AM";
    String hour = (_currentTime.hour % 12 == 0 ? 12 : _currentTime.hour % 12)
        .toString()
        .padLeft(2, '0');
    String minute = _currentTime.minute.toString().padLeft(2, '0');
    String second = _currentTime.second.toString().padLeft(2, '0');
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '$amPm',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$hour',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' :',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextSpan(
            text: ' $minute ',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '$second',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
