import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
         {'text':'Black', 'score': 10},
         {'text': 'green', 'score': 5},
         {'text': 'red', 'score': 3},
         {'text': 'white', 'score': 1},
     ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
      {'text':'Rabbit', 'score': 3},
      {'text': 'Snake', 'score': 11},
      {'text': 'Elephant', 'score': 5},
      {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text':'Eren', 'score': 10},
        {'text': 'Emin', 'score': 5},
        {'text': 'Omar', 'score': 3},
        {'text': 'Berkay', 'score': 1},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz(){
    setState((){
      _questionIndex =0;
      _totalScore =0;
    });

  }
  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
