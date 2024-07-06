import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 79, 29, 130),
                Color.fromARGB(255, 117, 54, 211),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Learn Flutter the fun way!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
