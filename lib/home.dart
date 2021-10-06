import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/questions_answers_scores.dart';
import 'package:quiz/result.dart';
import 'package:quiz/answers.dart';
import 'package:quiz/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int questionIndex = 0;
  int totalScore = 0;
  int totalAnswerd = 0;
  int numberOfTheQuestion = 1;
  String level = "";
  bool answerd = false;
  bool firstClick = false;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    int randomNumber = random.nextInt(questionsAnswersScores.length);
    questionIndex = randomNumber;
  }

  void increaceTheIndex(int score) {
    setState(() {
      firstClick = true;
      answerd = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      answerd = false;
      questionsAnswersScores.removeAt(questionIndex);
      setState(() {
        firstClick = false;
        bu = Colors.blueAccent;
        if (questionsAnswersScores.length < 2) {
          questionIndex = 0;
        } else {
          Random random = Random();
          int randomNumber = random.nextInt(questionsAnswersScores.length);
          questionIndex = randomNumber;
        }
        numberOfTheQuestion++;
        totalAnswerd++;
        totalScore = totalScore + score;
        if (totalScore <= 5) {
          level = "ضعيف";
          resultLevel = Colors.red;
        } else if (totalScore > 5 && totalScore <= 10) {
          level = "جيد";
          resultLevel = Colors.amber;
        } else if (totalScore > 10 && totalScore <= 15) {
          level = "جيد جدا";
          resultLevel = Colors.blueAccent;
        } else if (totalScore > 15 && totalScore <= 20) {
          level = "ممتاز";
          resultLevel = Colors.green;
        }
      });
    });
  }

  void restartTheQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
      totalAnswerd = 0;
      numberOfTheQuestion = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: w,
        child: totalAnswerd <= 19
            ? Column(
                children: <Widget>[
                  Questions(
                    question: questionsAnswersScores[questionIndex]["question"],
                    numberOfTheQuestion: numberOfTheQuestion,
                  ),
                  ...questionsAnswersScores[questionIndex]["answers"]
                      .map((e) => Answers(
                            answer: e["answer"],
                            increacetheIndex: increaceTheIndex,
                            score: e["score"],
                            answerd: answerd,
                            firstClick: firstClick,
                          ))
                ],
              )
            : Result(
                restartTheQuiz: restartTheQuiz,
                totlaScore: totalScore,
                level: level,
                remainingQuestions: questionsAnswersScores.length,
              ));
  }
}
