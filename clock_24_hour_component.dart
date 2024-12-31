import 'dart:async';

import 'package:flutter/material.dart';

class Clock24HourComponent extends StatefulWidget {
  @override
  _Clock24HourComponentState createState() => _Clock24HourComponentState();
}

class _Clock24HourComponentState extends State<Clock24HourComponent>
    with TickerProviderStateMixin {
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
    String hour = _currentTime.hour.toString().padLeft(2, '0');
    String minute = _currentTime.minute.toString().padLeft(2, '0');
    String second = _currentTime.second.toString().padLeft(2, '0');

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFlipAnimation(
            // controller: _controller,
            value: hour,
            label: 'Hour',
          ),
          Text(
            ":",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildFlipAnimation(
            // controller: _controller,
            value: minute,
            label: 'Minute',
          ),
          Text(
            ":",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildFlipAnimation(
            // controller: _secondController,
            value: second,
            label: 'Second',
          ),
        ],
      ),
    );
  }

  Widget _buildFlipAnimation({
    // required AnimationController controller,
    required String value,
    required String label,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      // width: 80,
      height: 100,

      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
