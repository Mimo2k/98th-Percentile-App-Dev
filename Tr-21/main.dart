import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Quiz App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Are you ready to test your knowledge?',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _allQuestions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'text': 'Paris', 'score': 1},
        {'text': 'London', 'score': 0},
        {'text': 'Berlin', 'score': 0},
        {'text': 'Madrid', 'score': 0}
      ]
    },
    {
      'questionText': 'Which planet is known as the Red Planet?',
      'answers': [
        {'text': 'Mars', 'score': 1},
        {'text': 'Jupiter', 'score': 0},
        {'text': 'Saturn', 'score': 0},
        {'text': 'Earth', 'score': 0}
      ]
    },
    {
      'questionText': 'Who wrote "To Kill a Mockingbird"?',
      'answers': [
        {'text': 'Harper Lee', 'score': 1},
        {'text': 'Mark Twain', 'score': 0},
        {'text': 'J.K. Rowling', 'score': 0},
        {'text': 'F. Scott Fitzgerald', 'score': 0}
      ]
    },
    {
      'questionText': 'What is the largest planet in our Solar System?',
      'answers': [
        {'text': 'Jupiter', 'score': 1},
        {'text': 'Saturn', 'score': 0},
        {'text': 'Earth', 'score': 0},
        {'text': 'Mars', 'score': 0}
      ]
    },
    {
      'questionText': 'Who painted the Mona Lisa?',
      'answers': [
        {'text': 'Leonardo da Vinci', 'score': 1},
        {'text': 'Vincent van Gogh', 'score': 0},
        {'text': 'Pablo Picasso', 'score': 0},
        {'text': 'Claude Monet', 'score': 0}
      ]
    },
    {
      'questionText': 'Which element has the atomic number 1?',
      'answers': [
        {'text': 'Hydrogen', 'score': 1},
        {'text': 'Oxygen', 'score': 0},
        {'text': 'Carbon', 'score': 0},
        {'text': 'Nitrogen', 'score': 0}
      ]
    },
    {
      'questionText': 'In which country is the Great Pyramid of Giza?',
      'answers': [
        {'text': 'Egypt', 'score': 1},
        {'text': 'Mexico', 'score': 0},
        {'text': 'Peru', 'score': 0},
        {'text': 'India', 'score': 0}
      ]
    },
  ];

  late List<Map<String, Object>> _questions;
  int _questionIndex = 0;
  int _totalScore = 0;
  int _answeredQuestions = 0;
  bool _isQuizFinished = false;
  int _timeRemaining = 10;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _questions = _getRandomQuestions(5);
    _shuffleAnswers();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _timeRemaining = 10;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        _answerQuestion(0);
      }
    });
  }

  List<Map<String, Object>> _getRandomQuestions(int count) {
    final random = Random();
    return List<Map<String, Object>>.from(_allQuestions)
      ..shuffle(random)
      ..take(count).toList();
  }

  void _shuffleAnswers() {
    for (var question in _questions) {
      final answers = question['answers'] as List<Map<String, Object>>;
      answers.shuffle(Random());
    }
  }

  void _answerQuestion(int score) {
    _timer?.cancel();
    setState(() {
      _totalScore += score;
      _answeredQuestions++;
      _questionIndex++;

      if (_questionIndex >= _questions.length) {
        _isQuizFinished = true;
      } else {
        _shuffleAnswers();
        _startTimer();
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _answeredQuestions = 0;
      _isQuizFinished = false;
      _questions = _getRandomQuestions(5);
      _shuffleAnswers();
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientContainer(
        child: _isQuizFinished
            ? QuizSummary(
                totalScore: _totalScore,
                answeredQuestions: _answeredQuestions,
                resetQuiz: _resetQuiz)
            : QuizQuestion(
                question: _questions[_questionIndex]['questionText'] as String,
                answers: _questions[_questionIndex]['answers']
                    as List<Map<String, Object>>,
                onAnswerSelected: _answerQuestion,
                timeRemaining: _timeRemaining,
              ),
      ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final void Function(int) onAnswerSelected;
  final int timeRemaining;

  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.onAnswerSelected,
    required this.timeRemaining,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Time Remaining: $timeRemaining seconds',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 30),
          ...answers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                onPressed: () => onAnswerSelected(answer['score'] as int),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  answer['text'] as String,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class QuizSummary extends StatelessWidget {
  final int totalScore;
  final int answeredQuestions;
  final VoidCallback resetQuiz;

  const QuizSummary({
    required this.totalScore,
    required this.answeredQuestions,
    required this.resetQuiz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Finished!',
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent),
          ),
          const SizedBox(height: 20),
          Text(
            'Score: $totalScore out of $answeredQuestions',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: resetQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedGradientContainer extends StatefulWidget {
  final Widget child;

  const AnimatedGradientContainer({required this.child, super.key});

  @override
  _AnimatedGradientContainerState createState() =>
      _AnimatedGradientContainerState();
}

class _AnimatedGradientContainerState extends State<AnimatedGradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: true);
    _alignmentAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alignmentAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _alignmentAnimation.value,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple, Colors.teal],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}
