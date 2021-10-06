import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answer;
  final int score;
  final Function increacetheIndex;

  const Answers(
      {Key? key,
      required this.answer,
      required this.increacetheIndex,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        child: Text(
          answer,
          style: const TextStyle(fontSize: 22),
        ),
        onPressed: () {
          increacetheIndex(score);
        },
      ),
    );
  }
}
