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
  final QuizQuestion currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            onTap: () {},
            buttonText: currentQuestion.answers[0],
          ),
          AnswerButton(
            onTap: () {},
            buttonText: currentQuestion.answers[1],
          ),
          AnswerButton(
            onTap: () {},
            buttonText: currentQuestion.answers[2],
          ),
          AnswerButton(
            onTap: () {},
            buttonText: currentQuestion.answers[3],
          ),
        ],
      ),
    );
  }
}
