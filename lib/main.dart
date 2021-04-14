import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question_bank.dart';

QuestionBank quiz = QuestionBank();
void main() => runApp(quizApp());

// ignore: camel_case_types
class quizApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: Text(
            "Quiz Yourself",
            style: TextStyle(
                color: Colors.teal.shade900,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                fontFamily: "AkayaTelivigala"),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> results = [];
  int score = 0;
  void userChoice(bool answers) {
    bool correctAnswer = quiz.answerGiver();
    setState(
      () {
        if (quiz.isFinished() == true) {
          Alert(
            context: context,
            title: 'Finished!',
            desc:
                'You\'ve reached the end of the quiz and your score is $score',
            image: Image.asset("images/final.jpg"),
          ).show();
          quiz.reset();
          results = [];
        } else {
          if (correctAnswer == answers) {
            score = score + 1;
            results.add(
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
            );
          } else {
            results.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          quiz.counterQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.questionGiver(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Oswald",
                  color: Colors.purple.shade200,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontFamily: 'AkayaTelivigala',
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                userChoice(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontFamily: 'AkayaTelivigala',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                userChoice(false);
              },
            ),
          ),
        ),
        Row(
          children: results,
        ),
      ],
    );
  }
}
