import 'package:flutter/material.dart';
import 'package:quiz/color.dart';

class Answers extends StatefulWidget {
  final String answer;
  final int score;
  final Function increacetheIndex;
  final bool answerd;
  final bool firstClick;

  const Answers({
    Key? key,
    required this.answer,
    required this.increacetheIndex,
    required this.score,
    required this.answerd,
    required this.firstClick,
  }) : super(key: key);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  Color buttonColor = bu;

  void changeButtonColor() {
    setState(() {
      
      if (widget.score == 0) {
        buttonColor = Colors.redAccent.withOpacity(.7);
      } else {
        buttonColor = Colors.green;
      }
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        buttonColor = bu;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: buttonColor),
        child: Text(
          widget.answer,
          style: const TextStyle(fontSize: 22),
        ),
        onPressed: () {
          if (!widget.firstClick) {
            changeButtonColor();
            widget.increacetheIndex(widget.score);
          }
        },
      ),
    );
  }
}

