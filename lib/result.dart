import 'package:flutter/material.dart';
import 'package:quiz/color.dart';

class Result extends StatelessWidget {
  final Function restartTheQuiz;
  final int totlaScore;
  final int remainingQuestions;
  final String level;

  const Result({
    Key? key,
    required this.restartTheQuiz,
    required this.totlaScore,
    required this.level,
    required this.remainingQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$totlaScore/20 : الدرجة",
            style: TextStyle(color: b, fontSize: 20),
          ),
          Text(
            "المستوى : $level",
            style: TextStyle(color: b, fontSize: 20),
          ),
          TextButton(
              onPressed: () {
                if (remainingQuestions > 1) {
                  restartTheQuiz();
                } else {
                  null;
                }
              },
              child: remainingQuestions > 1
                  ? const Text(
                      "إعادة اللعب ",
                      style: TextStyle(fontSize: 18),
                    )
                  : Text("لقد أتممت كل الأسئلة",
                      style: TextStyle(fontSize: 18, color: b54)))
        ],
      ),
    );
  }
}
