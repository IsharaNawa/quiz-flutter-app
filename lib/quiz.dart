import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/start_screen.dart';

// create the stateful widget
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// create the private class
class _QuizState extends State<Quiz> {
  // create the list for storing the answers
  List<String> selectedAnswers = [];

  // save the active screen
  Widget? activeScreen;

  // initialize the widget(when the widget first runs)
  @override
  void initState() {
    activeScreen = StartScreen(swtichScreen);
    super.initState();
  }

  // call this function when the answer is selected
  void addSelectedAnswer(String answer) {
    selectedAnswers.add(answer);

    // check if all the answers are selected
    if (selectedAnswers.length == questions.length) {
      // if so, set the active screen to start screen
      setState(() {
        selectedAnswers = [];
        activeScreen = ResultsScreen(
          choosenAnswers: selectedAnswers,
        );
      });
    }
  }

  // this function should run when the user clicks on the button
  // in start screen
  // therefore this function should be passed to startScreen widget
  void swtichScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: addSelectedAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 79, 29, 130),
                Color.fromARGB(255, 149, 103, 218),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
