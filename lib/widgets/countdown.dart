import 'package:flutter/material.dart';

class Countdown extends StatelessWidget {
  final int _time;

  Countdown(this._time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 30,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: FittedBox(
              child: Text(
            _time.toString(),
            style: TextStyle(fontSize: 26),
          )),
        ),
      ),
    );
  }
}
