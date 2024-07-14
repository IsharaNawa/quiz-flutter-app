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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: data["user_answer"] == data["correct_answer"]
                          ? Color.fromARGB(255, 46, 220, 220)
                          : Color.fromARGB(255, 214, 66, 179),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Color.fromARGB(255, 198, 131, 186),
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 65, 163, 233),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
