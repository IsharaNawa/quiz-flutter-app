import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionNumber = 0;

  @override
  void initState() {
    questionNumber = 0;
    super.initState();
  }

  void moveToNextQuestion() {
    setState(() {
      if (questionNumber < questions.length - 1) {
        questionNumber += 1;
      } else {
        
      }
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
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[questionNumber].getShuffledAnswers().map((answer) {
              return AnswerButton(
                buttonText: answer,
                onTap: moveToNextQuestion,
              );
            })
          ],
        ),
      ),
    );
  }
}
