import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/play_quiz_sreen.dart';

class StartQuizSreen extends StatelessWidget {
  const StartQuizSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Start Quiz",
          style: TextStyle(
            color: backgroundColor
          ),
        ),
        centerTitle: true,
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Quiz App",
              style: TextStyle(
                color: foregroundColor,
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: foregroundColor
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>const PlayQuizScreen()
                  )
                );
              },
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  color: backgroundColor,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}