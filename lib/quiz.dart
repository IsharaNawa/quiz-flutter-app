import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

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
  // save the active screen
  Widget? activeScreen;

  // initialize the widget(when the widget first runs)
  @override
  void initState() {
    activeScreen = StartScreen(swtichScreen);
    super.initState();
  }

  // this function should run when the user clicks on the button
  // in start screen
  // therefore this function should be passed to startScreen widget
  void swtichScreen() {
    setState(() {
      activeScreen = QuestionsScreen();
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
