import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/results_summary.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(this.resultData, this.goToQuestionScreen, {super.key});

  final void Function() goToQuestionScreen;
  final List<Map<String, Object>> resultData;

  @override
  Widget build(BuildContext context) {
    final numOfQuestions = questions.length;
    var numCorrectAnswers = resultData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You have answered $numCorrectAnswers out of $numOfQuestions questions',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 180, 216, 241),
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ResultSummary(resultData),
            const SizedBox(height: 20),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: goToQuestionScreen,
              label: const Text(
                'restart Quiz',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: TextButton.styleFrom(
                iconColor: Colors.white,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                backgroundColor: const Color.fromARGB(255, 1, 25, 42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
