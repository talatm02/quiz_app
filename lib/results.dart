import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_summary.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    var summaryData = <Map<String, Object>>[];
    for (var i = 0; i < chosenAnswers.length; i++) {
      final question = questions[i];
      final userAnswer = chosenAnswers[i];
      final correctAnswer = question.answers[0];
      summaryData.add({
        'questionIndex': i,
        'question': question.question,
        'userAnswer': userAnswer,
        'correctAnswer': correctAnswer,
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summayData = getSummaryData();
    final correctAnswers = summayData
        .where((data) => data['userAnswer'] == data['correctAnswer'])
        .length;
    final totalQuestions = summayData.length;

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly!',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ResultSummary(summaryData: summayData),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onRestartQuiz,
            icon: const Icon(Icons.arrow_right_alt, color: Colors.black),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                )),
            label: const Text('Restart Quiz',
                style: TextStyle(fontSize: 15, color: Colors.black)),
          )
        ],
      ),
    );
  }
}
