import 'package:flutter/material.dart';

import 'dart:math';

import './widgets/question.dart';
import './widgets/score.dart';
import './widgets/end_game.dart';
import './widgets/answers.dart';
import './widgets/highest_score.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick maths!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Quick Maths!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;
  final _random = new Random();
  int _num1;
  int _num2;
  List<int> _possibleAnswers = [];
  int _highestScore = 0;

  void _generateNewNums() {
    _num1 = _getRand(5, 15);
    _num2 = _getRand(5, 15);
  }

  void _generatePossibleAnswers() {
    int ans = _num1 + _num2;
    double threshold = 0.2;
    Set<int> tempSet = {};

    tempSet.add(ans);
    while (tempSet.length != 4) {
      tempSet.add(
        _getRand(
          ans - (ans * threshold).round(),
          ans + (ans * threshold).round(),
        ),
      );
    }
    _possibleAnswers = tempSet.toList();
  }

  void _startNewRound() {
    setState(() {
      _generateNewNums();
      _generatePossibleAnswers();
    });
  }

  void _resetScore() {
    setState(() {
      _score = 0;
    });
  }

  void _restartGame() {
    if (_score > _highestScore) _highestScore = _score;
    _resetScore();
    _startNewRound();
  }

  void _showEndGame(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return EndGame(
            _num1,
            _num2,
            _restartGame,
          );
        },
        isDismissible: false);
  }

  int _getRand(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  bool _checkAnswer(int ans) {
    return _num1 + _num2 == ans;
  }

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_num1 == null || _num2 == null || _possibleAnswers.isEmpty) {
      _startNewRound();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(children: <Widget>[
          HighestScore(_highestScore),
          Score(_score),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 30),
            child: Question(_num1, _num2),
          ),
          Answers(
            _possibleAnswers,
            _checkAnswer,
            _incrementScore,
            _showEndGame,
            _startNewRound,
          ),
        ]),
      ),
    );
  }
}
