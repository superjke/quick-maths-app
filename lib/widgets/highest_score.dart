import 'package:flutter/material.dart';

class HighestScore extends StatelessWidget {
  final int _highScore;

  HighestScore(this._highScore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child: Card(
        color: _highScore > 0 ? Colors.red : Colors.grey,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Best: $_highScore',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
