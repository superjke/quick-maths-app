import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  final int _num1;
  final int _num2;
  final Function _restart;

  EndGame(this._num1, this._num2, this._restart);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 10),
            child: Text(
              "Incorrect",
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "The correct answer was",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "${_num1 + _num2}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: IconButton(
              icon: Icon(Icons.refresh),
              iconSize: 60,
              color: Colors.blue,
              onPressed: () {
                _restart();
                Navigator.of(context).pop();
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _restart();
              Navigator.of(context).pop();
            },
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
