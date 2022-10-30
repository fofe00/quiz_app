import 'package:flutter/material.dart';
import 'quiz_question_model.dart';

const backgroundColor = Color.fromRGBO(45, 27, 3, 1);
const foregroundColor = Color.fromRGBO(244, 140, 6, 1);
List<QuizQuestionModel> quizQuestion = [
  QuizQuestionModel(
    question: "Lequel des éléments suivants n’est pas un concept POO en Java?",
    correctAnswer: "Compilation",
    option: [
      "Héritage",
      "Encapsulation",
      "Polymorphisme",
      "Compilation",
    ],
  ),
  QuizQuestionModel(
    question: "Quand la surcharge de méthode est-elle déterminée?",
    correctAnswer: "Au moment de la compilation",
    option: [
      "Au moment de l’exécution",
      "Au moment de la compilation",
      "Au moment du codage",
    ],
  ),
  QuizQuestionModel(
    question: " Comment ça s’appelle si un objet a son propre cycle de vie?",
    correctAnswer: "Association",
    option: [
      "Agrégation",
      "Composition",
      "Encapsulation",
      "Association",
    ],
  ),
];
