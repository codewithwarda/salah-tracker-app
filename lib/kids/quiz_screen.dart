// ✅ Fully styled quiz_screen.dart with tick feature (no red on wrong answers)
import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What kind of animal swallowed Yunus?',
      'options': ['A shark', 'A dolphin', 'A Whale', 'A crocodile'],
      'correct': 2
    },
    {
      'question': 'What did Prophet Yunus do in the whale?',
      'options': ['Sleep', 'Cry', 'Pray', 'Sing'],
      'correct': 2
    },
    {
      'question': 'What plant grew beside Yunus (AS)?',
      'options': ['Olive', 'Apple', 'Yaqteen', 'Date'],
      'correct': 2
    },
    {
      'question': 'What did the people of Nineveh do after the warning?',
      'options': ['Ignored', 'Believed', 'Fought', 'Left'],
      'correct': 1
    },
  ];

  final Map<int, int> selectedAnswers = {};

  void _submitAnswers() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['correct']) {
        score++;
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          score: score,
          total: questions.length,
          backgroundImage:
              'lib/assets/images/stories/yunus/quiz_background.png',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Yunus (AS)',
            style: TextStyle(
              fontFamily: 'Snell Roundhand',
              fontSize: 24,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/images/stories/yunus/quiz_background.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text('Quiz Time!',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    const SizedBox(height: 20),
                    for (int i = 0; i < questions.length; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${i + 1}. ${questions[i]['question']}',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(4, (j) {
                              bool isSelected = selectedAnswers[i] == j;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAnswers[i] = j;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.green.shade100
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected
                                        ? Border.all(
                                            color: Colors.green,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(questions[i]['options'][j]),
                                      if (isSelected)
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    Center(
                      child: ElevatedButton(
                        onPressed: selectedAnswers.length == questions.length
                            ? _submitAnswers
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
