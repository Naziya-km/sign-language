import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial'),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> _questions = [
    {
      'question':
          'What is the sign for the letter A in American Sign Language(ASL)?',
      'options': [
        'Open hand',
        'Closed first with thumb on the side',
        'Pointing finger',
        'Waving hand',
      ],
      'answer': 'Closed first with thumb on the side',
    },
    {
      'question': 'How does the B sign look like in ASL?',
      'options': [
        'a closed fist',
        'two fingers crossed',
        'all fingers extended with the thumb against the palm',
        'a peace sign',
      ],
      'answer': 'all fingers extended with the thumb against the palm',
    },
    {
      'question': 'the letter C in ASL is signed by?',
      'options': [
        'forming a "c" shape with fingers',
        'raising index finger',
        'folding fingers inward',
        'holding up three fingers',
      ],
      'answer': 'forming a "c" shape with fingers',
    },
    {
      'question': 'How do you sign the letter D in ASL?',
      'options': [
        'forming a "c" shape with fingers',
        'index fingers up,thumb touching middle fingers forming D shape',
        'folding fingers inward',
        'holding up three fingers',
      ],
      'answer':
          'index fingers up,thumb touching middle fingers forming D shape',
    },
    {
      'question': 'the letter E in ASL is signed by?',
      'options': [
        'Closing fingers over the thumb',
        'raising index finger',
        'folding fingers inward',
        'holding up three fingers',
      ],
      'answer': 'Closing fingers over the thumb',
    },
    {
      'question': 'How do you say "Hello" in ASL?',
      'options': [
        'tapping fingers',
        'waving one hand',
        'folding fingers inward',
        'holding up three fingers',
      ],
      'answer': 'waving one hand',
    },
    {
      'question': 'what is the sign for "Thank You"?',
      'options': [
        'pointing at heart',
        'raising index finger',
        'Open palm moving away from chin',
        'holding up three fingers',
      ],
      'answer': 'Open palm moving away from chin',
    },
    {
      'question': 'How do you sign "Yes" in ASL?',
      'options': [
        'nodding head',
        'a closed fist moving up and down',
        'folding fingers inward',
        'crossing fingers',
      ],
      'answer': 'a closed fist moving up and down',
    },
    {
      'question': 'How do you sign "I Love You" in ASL?',
      'options': [
        'nodding head',
        'thumb, index , and pinky fingers extended',
        'folding fingers inward',
        'crossing fingers',
      ],
      'answer': 'thumb, index , and pinky fingers extended',
    },
    {
      'question': 'How do you sign "No" in ASL?',
      'options': [
        'thumb and index finger tapping together',
        'a closed fist moving up and down',
        'folding fingers inward',
        'crossing fingers',
      ],
      'answer': 'thumb and index finger tapping together',
    },
    {
      'question': 'How do you sign "Good Morning" in ASL?',
      'options': [
        'nodding head',
        'a closed fist moving up and down',
        'hand from chin + arm raising like the sun',
        'crossing fingers',
      ],
      'answer': 'hand from chin + arm raising like the sun',
    },
    {
      'question': 'How do you sign "please" in ASL?',
      'options': [
        'closed fist moving in a circular motion on chest',
        'a closed fist moving up and down',
        'open hand rubbing in a circular motion on chest',
        'crossing fingers',
      ],
      'answer': 'open hand rubbing in a circular motion on chest',
    },
    {
      'question': 'How do you sign "Water" in ASL?',
      'options': [
        'fingers toching lips',
        'a closed fist on open palm moving up',
        'folding fingers inward',
        '"w" shape with index finger tapping chin',
      ],
      'answer': '"w" shape with index finger tapping chin',
    },

    //  {
    //   'question': 'How do you sign "Yes" in ASL?',
    //   'options': ['nodding head', 'a closed fist moving up and down', 'folding fingers inward', 'crossing fingers'],
    //   'answer': 'a closed fist moving up and down',
    // },

    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
    //    {
    //   'question': 'the letter C in ASL is signed by?',
    //   'options': ['forming a "c" shape with fingers', 'raising index finger', 'folding fingers inward', 'holding up three fingers'],
    //   'answer': 'forming a "c" shape with fingers',
    // },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _checkAnswer(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
      setState(() {
        _score++;
      });
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              'Quiz Completed!',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'Your score is $_score out of ${_questions.length}.',
              style: const TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _resetQuiz();
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              ),
            ],
          ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 32, 52),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Quiz',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question Text
            Text(
              _questions[_currentQuestionIndex]['question'] as String,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Answer Options
            ...(_questions[_currentQuestionIndex]['options'] as List<String>)
                .map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () => _checkAnswer(option),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          239,
                          240,
                          241,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.black45,
                        elevation: 8,
                      ),
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                })
                .toList(),
          ],
        ),
      ),
    );
  }
}
