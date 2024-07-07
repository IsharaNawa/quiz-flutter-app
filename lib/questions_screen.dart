import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionNumber = 0;

  void moveToNextQuestion(String answer) {
    setState(() {
      questionNumber += 1;
      widget.onSelectAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[questionNumber].question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[questionNumber].getShuffledAnswers().map((answer) {
              return AnswerButton(
                buttonText: answer,
                onTap: () {
                  moveToNextQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
