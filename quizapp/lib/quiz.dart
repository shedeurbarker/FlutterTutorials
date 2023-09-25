import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/summary_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentChoice = 'start-screen';
  List<Map<String, Object>> resultData = [];

  void goToQuestionScreen() {
    setState(() {
      resultData = [];
      currentChoice = 'question-screen';
    });
  }

  void goToSummaryScreen(List<Map<String, Object>> result) {
    resultData = result;

    setState(() {
      currentChoice = 'summary-screen';
    });
  }

  void quitQuiz() {
    setState(() {
      currentChoice = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen = StartScreen(goToQuestionScreen);
    if (currentChoice == 'start-screen') {
      currentScreen = StartScreen(goToQuestionScreen);
    } else if (currentChoice == 'question-screen') {
      currentScreen = QuestionsScreen(quitQuiz, goToSummaryScreen);
    } else if (currentChoice == 'summary-screen') {
      currentScreen = SummaryScreen(resultData, goToQuestionScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: const Color.fromARGB(255, 1, 44, 72),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 1, 44, 72),
                Color.fromARGB(255, 4, 58, 87),
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
