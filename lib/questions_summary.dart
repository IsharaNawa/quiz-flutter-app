import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.questionData, {super.key});

  final List<Map<String, Object>> questionData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: questionData.map((data) {
            return Row(
              children: [
                Text(
                  ((data["question_index"] as int) + 1).toString(),
                  style: TextStyle(
                      color: data["user_answer"] == data["correct_answer"]
                          ? Colors.green
                          : Colors.red),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data["question"] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data["user_answer"] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 232, 153, 217),
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 65, 163, 233),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
