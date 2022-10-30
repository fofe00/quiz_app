import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/play_quiz_sreen.dart';

class ResultScreen extends StatelessWidget {
  int correctAnswer, wrongAnswer;
  ResultScreen(
      {super.key, required this.correctAnswer, required this.wrongAnswer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: foregroundColor,
        title: const Text(
          "Result",
          style: TextStyle(color: backgroundColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: backgroundColor),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnswerTab("Correct Answer", correctAnswer),
                AnswerTab("Wron Answer", wrongAnswer),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: foregroundColor),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayQuizScreen()),
                    (route) => false);
              },
              child: const Text(
                "Reset Quiz",
                style: TextStyle(
                    color: backgroundColor, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column AnswerTab(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          "$value",
          style: const TextStyle(
            color: foregroundColor,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
