import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';

class Results extends StatelessWidget {
  const Results({super.key, required this.chosenAnswer});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  final List<String> chosenAnswer;
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly', style: TextStyle(color: Colors.white),),
            const SizedBox(height: 50),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {},
              child: Text("Restart quiz"),
            )
          ],
        ),
      ),
    );
  }
}
