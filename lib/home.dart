import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 20),
        const Text(
          'Let\'s Quiz!',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: startQuiz,
          icon: const Icon(Icons.arrow_right_alt, color: Colors.black),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              )),
          label: const Text('Start Quiz',
              style: TextStyle(fontSize: 15, color: Colors.black)),
        )
      ],
    );
  }
}
