import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answer_buttons.dart';
import 'package:quizapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.quitQuiz, this.goToSummary, {super.key});
  final void Function() quitQuiz;
  final void Function(List<Map<String, Object>>) goToSummary;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestion = 0;
  List<String> chosenAnswers = [];

  chooseAnswer(String chosenOption) {
    chosenAnswers.add(chosenOption);
    List<Map<String, Object>> summaryData = [];
    if (chosenAnswers.length < questions.length) {
      setState(() {
        currentQuestion++;
      });
    } else {
      for (var i = 0; i < chosenAnswers.length; i++) {
        summaryData.add({
          'question_index': i,
          'question': questions[i].question,
          'user_answer': chosenAnswers[i],
          'correct_answer': questions[i].answers[0],
        });
      }
      widget.goToSummary(summaryData);
    }
  }

  @override
  Widget build(context) {
    final question = questions[currentQuestion];

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.question,
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 137, 171, 240),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ...question.getShuffledAnswers().map((eachAnswer) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnswerButton(
                  onTap: () {
                    chooseAnswer(eachAnswer);
                  },
                  text: eachAnswer,
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          TextButton.icon(
            icon: const Icon(Icons.logout),
            onPressed: () {
              chosenAnswers = [];
              widget.quitQuiz();
            },
            label: const Text(
              'Quit',
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
    );
  }
}
