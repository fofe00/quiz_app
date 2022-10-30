import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/quiz_question_model.dart';
import 'package:quiz_app/result_screen.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  final PageController pageController = PageController();
  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnsers = 0;
  String correctAnswer = "", selectedAnswer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: foregroundColor,
        title: const Text(
          "Pay Quiz",
          style: TextStyle(color: backgroundColor),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: quizQuestion.length,
          itemBuilder: ((context, index) {
            QuizQuestionModel model = quizQuestion[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                      model.option.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isAnswerLocked = true;
                              selectedAnswer = model.option[index];
                              correctAnswer = model.correctAnswer;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedAnswer == model.option[index]
                                  ? foregroundColor
                                  : backgroundColor,
                              border: Border.all(
                                color: foregroundColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                model.option[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          })),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (isAnswerLocked) {
            if (selectedAnswer == correctAnswer) {
              correctAnswers++;
            } else {
              wrongAnsers++;
            }
            currentIndex++;
            if (currentIndex != quizQuestion.length) {
              pageController.jumpToPage(currentIndex);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          correctAnswer: correctAnswers,
                          wrongAnswer: wrongAnsers,
                        )),
              );
            }
          } else {
            print("Please select an option");
          }
        },
        child: Container(
          height: 70,
          color: foregroundColor,
          alignment: Alignment.center,
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
