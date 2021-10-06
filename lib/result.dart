import 'package:flutter/material.dart';
import 'package:quiz/color.dart';

class Result extends StatelessWidget {
  final Function restartTheQuiz;
  final int totlaScore;
  final int remainingQuestions;
  final String level;
  final String resulSound;

  const Result({
    Key? key,
    required this.restartTheQuiz,
    required this.totlaScore,
    required this.level,
    required this.remainingQuestions,
    required this.resulSound,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$totlaScore/20",
            style: TextStyle(color: b, fontSize: 35),
          ),
          Container(
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                level,
                style: TextStyle(color: resultLevel, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: w,
              border: Border.all(width: 5, color: resultLevel),
            ),
          ),
          Center(
              child: remainingQuestions > 1
                  ? ElevatedButton(
                      onPressed: () {
                        restartTheQuiz();
                      },
                      child: const Text(
                        "إعادة اللعب",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ))
                  : Text("لقد أتممت كل الإختبارات",
                      style: TextStyle(fontSize: 17, color: b54)))
        ],
      ),
    );
  }
}
