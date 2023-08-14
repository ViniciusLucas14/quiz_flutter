import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] as String ==
                data['correct_answer'] as String;
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: (data['question'] as String).toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 247, 1, 255),
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              isCorrect
                                  ? Icons.check_circle_outlined
                                  : Icons.close_outlined,
                              size: 14,
                              color: isCorrect ? Colors.green : Colors.red,
                            ))
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 1, 111, 255)),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 1, 255, 85)),
                      ),
                      const SizedBox(height: 25),
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
