import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key, required this.choosenAnswers, required this.restartQuiz});

  final List<String> choosenAnswers;
  final void Function() restartQuiz;
  int numberOfCorrectlyAnsweredQuestions = 0;
  int numberOfTotalQuestions = 0;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    numberOfTotalQuestions = choosenAnswers.length;

    numberOfCorrectlyAnsweredQuestions = getSummaryData().where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numberOfCorrectlyAnsweredQuestions out of $numberOfTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.refresh_outlined,
              ),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
