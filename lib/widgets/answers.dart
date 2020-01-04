import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final List<int> _possibleAnswers;
  final Function _incrementScore;
  final Function _showEndGame;
  final Function _checkAnswer;
  final Function _startNewRound;

  Answers(
    this._possibleAnswers,
    this._checkAnswer,
    this._incrementScore,
    this._showEndGame,
    this._startNewRound,
  );

  @override
  Widget build(BuildContext context) {
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
                  _startNewRound();
                } else {
                  _showEndGame(context, 0);
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
  }
}
