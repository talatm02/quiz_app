import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeWidget;

  // @override
  // void initState() {
  //   activeWidget = Home(changeWidget);
  //   super.initState();
  // }

  // void changeWidget() {
  //   setState(() {
  //     activeWidget = Question();
  //   });
  // }

  final List<String> selectedAnswers = [];
  var activeWidget = 'Home';

  void changeWidget() {
    setState(() {
      activeWidget = 'Question';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      // selectedAnswers.clear();
      setState(() {
        activeWidget = 'Results';
      });
    }
  }

  void onRestartQuiz() {
    setState(() {
      activeWidget = 'Home';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Home(changeWidget);

    if (activeWidget == 'Question') {
      screenWidget = Question(onSelectAnswer: chooseAnswer);
    }

    if (activeWidget == "Results") {
      screenWidget =
          Result(chosenAnswers: selectedAnswers, onRestartQuiz: onRestartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.green,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: screenWidget),
        ),
      ),
    );
  }
}
