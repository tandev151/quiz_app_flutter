import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/brain.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz App')),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeepers = [];

  void checkAnswer(bool yourChoice) {
    Icon icon = Icon(Icons.close);

    if (brain.getAnswer() == yourChoice) {
      icon = Icon(Icons.check);
    }

    scoreKeepers.add(icon);
  }

  Brain brain = new Brain();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Center(
              child: Text(
                brain.getQuestion(),
                style: TextStyle(),
              ),
            )),
        Expanded(
            flex: 1,
            child: MaterialButton(
              minWidth: double.infinity,
              child: Text(
                'True',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  brain.getNextQuestion();
                  checkAnswer(true);
                });
              },
              color: Colors.green[400],
            )),
        Expanded(
            flex: 1,
            child: MaterialButton(
              minWidth: double.infinity,
              onPressed: () {
                setState(() {
                  brain.getNextQuestion();
                  checkAnswer(false);
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              color: Colors.red[400],
            )),
        Expanded(
            child: Row(
          children: scoreKeepers,
        )),
      ],
    );
  }
}
