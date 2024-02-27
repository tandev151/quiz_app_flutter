import 'package:quiz_app_flutter/question.dart';

class Brain {
  int questionNumber = 0;
  List<Question> questionList = [
    Question(question: 'Do you free at night?', answer: false),
    Question(question: 'Do you free at morning?', answer: false),
    Question(question: 'Do you free at afternoon?', answer: false),
    Question(question: 'Do you free at dinner?', answer: false),
    Question(question: 'Do you free at evening?', answer: false),
    Question(question: 'Do you free at 9PM?', answer: false),
    Question(question: 'Do you free at 7AM?', answer: false),
  ];

  void getNextQuestion() {
    if (questionNumber < questionList.length - 1) {
      questionNumber++;
    }
  }

  String getQuestion() {
    return questionList[questionNumber].question;
  }

  bool getAnswer() {
    return questionList[questionNumber].answer;
  }
}
