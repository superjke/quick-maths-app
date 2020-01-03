import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final List<int> _possibleAnswers;
  final Function _incrementScore;
  final Function _showEndGame;
  final Function _checkAnswer;

  Answers(
    this._possibleAnswers,
    this._checkAnswer,
    this._incrementScore,
    this._showEndGame,
  );

  @override
  Widget build(BuildContext context) {
    _possibleAnswers.shuffle();
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: _possibleAnswers
            .map(
              (item) => FlatButton(
                 onPressed: () {
                if (_checkAnswer(item)) {
                  _incrementScore();
                } else {
                  _showEndGame(context);
                }
              },
                child: Text(
                  item.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.blue,
              ),
            )
            .toList(),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Expanded(
    //       child: Container(
    //         height: 200,
    //         padding: EdgeInsets.only(left: 5, right: 5),
    //         child: FlatButton(
    //           child: Text(
    //             _possibleAnswers[0].toString(),
    //             style: TextStyle(
    //               fontSize: 50,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           color: Colors.blue,
    //           onPressed: () {
    //             if (_checkAnswer(_possibleAnswers[0])) {
    //               _incrementScore();
    //             } else {
    //               _showEndGame(context);
    //             }
    //           },
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         height: 200,
    //         padding: EdgeInsets.only(left: 5, right: 0),
    //         child: FlatButton(
    //           child: Text(
    //             _possibleAnswers[1].toString(),
    //             style: TextStyle(
    //               fontSize: 50,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           color: Colors.blue,
    //           onPressed: () {
    //             if (_checkAnswer(_possibleAnswers[1])) {
    //               _incrementScore();
    //             } else {
    //               _showEndGame(context);
    //             }
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
