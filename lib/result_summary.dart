import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var isCorrect = data['userAnswer'] == data['correctAnswer'];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isCorrect ? Colors.green : Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isCorrect ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(((data['questionIndex'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['userAnswer'].toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: isCorrect
                                ? Colors.green[300]
                                : Colors.red[300]),
                      ),
                      Text(
                        data['correctAnswer'].toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }).toList(),
        ),
      ),
    );
  }
}
