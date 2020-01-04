import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  final int _num1;
  final int _num2;
  final Function _restart;
  /*
  reason is used to flag why the game ended.
  0 - Wrong answer
  1 - Out of itme
  */
  final int _reason;

  EndGame(this._num1, this._num2, this._restart, this._reason);


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
           Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                  child: _reason == 0
              ? Text(
                    "Incorrect",
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ): Text(
                    "Out of time!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ,
          _reason == 0 ? Text(
            "The correct answer was",
            style: TextStyle(
              fontSize: 20,
            ),
          ) : Container(),
          _reason == 0 ? Text(
            "${_num1 + _num2}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ) : Container(),
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
