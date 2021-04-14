import "questions.dart";

int _i = 0;

class QuestionBank {
  List<Question> _questionBank = [
    Question(q: "Rahul Gandhi is the prime minister of India.", a: false),
    Question(q: "Mount Everest is the highest peak of World.", a: true),
    Question(q: "Game of thrones is a web series.", a: true),
    Question(q: "Amitabh Bachhan has a worth of 565 Crores.", a: false),
    Question(q: "Earth is sphere.", a: true),
    Question(q: "India won the world cup in 2011.", a: true),
    Question(q: "Virat Kohli hit the winning six of 2011 worldcup.", a: false),
    Question(q: "Engineering is very easy.", a: false),
  ];
  void counterQuestion() {
    if (_i < _questionBank.length - 1) {
      _i++;
    }
  }

  bool isFinished() {
    if (_i >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _i = 0;
  }

  String questionGiver() {
    return _questionBank[_i].questionText;
  }

  bool answerGiver() {
    return _questionBank[_i].questionAnswer;
  }
}
