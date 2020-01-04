import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int _score;

  Score(this._score);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Score: $_score',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
