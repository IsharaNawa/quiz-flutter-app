import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // accept a function so that it can be called when the button is pressed
  const StartScreen(this.swtichScreen, {super.key});

  final void Function() swtichScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color: const Color.fromARGB(150, 255, 255, 255),
            width: 250,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Color.fromARGB(255, 216, 196, 229),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: swtichScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.arrow_circle_right_rounded,
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
