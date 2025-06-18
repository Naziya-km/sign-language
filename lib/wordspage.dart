import 'package:flutter/material.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _words = [
    {
      'word': 'Hello',
      'description':
          'To sign "Hello" in sign language, extend your fingers and thumb together, place your hand at your forehead, and move it away as if saluting.',
      'image': 'Images/hello.png',

      'questions': [
        {
          'question': 'How do you sign "Hello"?',
          'answer':
              'Extend fingers and thumb, place at forehead, and move away.',
        },
        {
          'question': 'What is the purpose of the "Hello" sign?',
          'answer': 'It is used as a greeting in sign language.',
        },
        {
          'question': 'Which part of the hand is used for signing "Hello"?',
          'answer': 'Fingers and thumb together.',
        },
      ],
    },

    {
      'word': 'Goodbye',
      'description':
          'To sign "Goodbye", open and close your hand as if waving.',
      'image': 'Images/goodbye.png',
      'questions': [
        {
          'question': 'How do you sign "Goodbye"?',
          'answer': 'Open and close hand in a waving motion.',
        },
      ],
    },
    {
      'word': 'Yes',
      'description': 'To sign "Yes", make a fist and nod it up and down.',
      'image': 'Images/yes.png',
      'questions': [
        {
          'question': 'How do you sign "Yes"?',
          'answer': 'Make a fist and nod it up and down.',
        },
      ],
    },
    {
      'word': 'No',
      'description':
          'To sign "No", extend your index and middle fingers and tap them against your thumb.',
      'image': 'Images/no.png',
      'questions': [
        {
          'question': 'How do you sign "No"?',
          'answer': 'Extend index and middle fingers, tap against thumb.',
        },
      ],
    },
    {
      'word': 'Please',
      'description':
          'To sign "Please", place your hand on your chest and move it in a circular motion.',
      'image': 'Images/please.png',
      'questions': [
        {
          'question': 'How do you sign "Please"?',
          'answer': 'Hand on chest, move in circular motion.',
        },
      ],
    },
    {
      'word': 'Sorry',
      'description':
          'To sign "Sorry", make a fist and move it in a circular motion on your chest.',
      'image': 'Images/sorry.png',
      'questions': [
        {
          'question': 'How do you sign "Sorry"?',
          'answer': 'Make a fist, move in a circular motion on chest.',
        },
      ],
    },
    {
      'word': 'Help',
      'description':
          'To sign "Help", make a fist with one hand and place it on the palm of the other, then lift both hands together.',
      'image': 'Images/help.png',
      'questions': [
        {
          'question': 'How do you sign "Help"?',
          'answer': 'Make a fist, place on palm, lift both hands.',
        },
      ],
    },
    {
      'word': 'Excuse Me',
      'description':
          'To sign "Excuse Me", place the fingertips of one hand on the palm of the other and make a small brushing motion.',
      'image': 'Images/excuse.webp',
      'questions': [
        {
          'question': 'How do you sign "Excuse Me"?',
          'answer': 'Fingertips on palm, small brushing motion.',
        },
      ],
    },
    // {
    //   'word': 'I Love You',
    //   'description': 'To sign "I Love You", extend the thumb, index finger, and pinky while keeping the other fingers folded.',
    //    'image: 'assets/hello.png',
    //   'questions': [
    //     {'question': 'How do you sign "I Love You"?', 'answer': 'Extend thumb, index finger, and pinky, keep other fingers folded.'},
    //   ],
    // },
    {
      'word': 'Thank You',
      'description':
          'To sign "Thank You", place your fingertips on your chin and move your hand forward, away from your face.',
      'image': 'Images/thanku.png',
      'questions': [
        {
          'question': 'How do you sign "Thank You"?',
          'answer': 'Place fingertips on chin and move hand forward.',
        },
        {
          'question': 'What is the meaning of this sign?',
          'answer': 'It is used to express gratitude.',
        },
        {
          'question': 'Which part of the face is involved in this sign?',
          'answer': 'The chin.',
        },
      ],
    },
  ];

  void _nextWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = _words[_currentIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 32, 52),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Words - ${currentWord['word']}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(currentWord['image'], height: 200),
            SizedBox(height: 20),
            Text(
              currentWord['description'],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            ...currentWord['questions'].map<Widget>((q) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q: ${q['question']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text("A: ${q['answer']}"),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _nextWord,
                child: Text("Next Word"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SentencesPage extends StatefulWidget {
  const SentencesPage({super.key});

  @override
  _SentencesPageState createState() => _SentencesPageState();
}

class _SentencesPageState extends State<SentencesPage> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _sentences = [
    // {
    //   'sentence': 'How are you?',
    //   'description': 'To sign "How are you?", bring both hands together with knuckles touching, then rotate one outward, followed by pointing towards the person.',
    //   'image': 'Images/howru,png',
    //   'questions': [
    //     {'question': 'How do you sign "How are you?"?', 'answer': 'Knuckles together, rotate one outward, then point.'},
    //     {'question': 'What is the meaning of this sign?', 'answer': 'It is used to ask someone about their well-being.'},
    //     {'question': 'Which part of the body is primarily used?', 'answer': 'Hands and fingers.'},
    //   ],
    // },
    {
      'sentence': 'What is your name?',
      'description':
          'To sign "What is your name?", extend your index and middle fingers on both hands, tap them together twice, then point at the person.',
      'image': 'Images/name.webp',
      'questions': [
        {
          'question': 'How do you sign "What is your name?"?',
          'answer': 'Extend index and middle fingers, tap twice, then point.',
        },
      ],
    },
    {
      'sentence': 'Nice to meet you',
      'description':
          'To sign "Nice to meet you", place one hand flat on the other, slide them apart, then bring both index fingers together.',
      'image': 'Images/meet.png',
      'questions': [
        {
          'question': 'How do you sign "Nice to meet you"?',
          'answer': 'Flat hand slide, index fingers meet.',
        },
      ],
    },
    {
      'sentence': 'See you later',
      'description':
          'To sign "See you later", point at your eye with your index finger, then extend your thumb and index finger in an L shape and move it forward.',
      'image': 'Images/seeyou.jpg',
      'questions': [
        {
          'question': 'How do you sign "See you later"?',
          'answer': 'Point at eye, then extend L-shape and move forward.',
        },
      ],
    },
    {
      'sentence': 'I love you',
      'description':
          'To sign "I love you", extend the thumb, index finger, and pinky while keeping the other fingers folded.',
      'image': 'Images/love.jpg',
      'questions': [
        {
          'question': 'How do you sign "I love you"?',
          'answer':
              'Extend thumb, index finger, and pinky, keep other fingers folded.',
        },
        {
          'question': 'What does this sign represent?',
          'answer': 'It expresses love and affection.',
        },
        {
          'question': 'Which fingers are used?',
          'answer': 'Thumb, index finger, and pinky.',
        },
      ],
    },
  ];

  void _nextSentence() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _sentences.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentSentence = _sentences[_currentIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 32, 52),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,

        // title: const Text(
        //   "Sentences - ${currentSentence['sentence']}")
        // style: TextStyle(
        //   fontSize: 22,
        //   fontWeight: FontWeight.bold,
        //   color: Colors.white,
        // ),
        centerTitle: true,
        title: Text("Sentences - ${currentSentence['sentence']}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                currentSentence['image'],
                height: 200, // Adjust size as needed
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              currentSentence['description'],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            ...currentSentence['questions'].map<Widget>((q) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q: ${q['question']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text("A: ${q['answer']}"),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _nextSentence,
                child: Text("Next Sentence"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
