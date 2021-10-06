import 'package:flutter/material.dart';
import 'package:quiz/color.dart';

class Questions extends StatelessWidget {
  final int numberOfTheQuestion;
  final String question;
  const Questions({
    Key? key,
    required this.question,
    required this.numberOfTheQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Center(
        child: Text(
          "$numberOfTheQuestion : $question ؟",
          style: TextStyle(fontSize: 28, color: b),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
