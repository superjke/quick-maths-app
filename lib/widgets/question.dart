import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final int num1;
  final int num2;

  Question(this.num1, this.num2);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$num1 + $num2',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
