// lib/kids/quiz_page.dart

import 'package:flutter/material.dart';
import 'package:salah_tracker_fe/content.dart';

// --- Start of Data Models (Duplicated here for self-containment; ideal for a 'models' folder) ---
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctAnswerIndex: json['correct_answer'] as int,
    );
  }
}

class Quiz {
  final String name;
  final List<Question> questions;

  Quiz({required this.name, required this.questions});

  factory Quiz.fromJson(String quizName, List<dynamic> questionListJson) {
    return Quiz(
      name: quizName,
      questions: questionListJson
          .map((qJson) => Question.fromJson(qJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
// --- End of Data Models ---

// --- Quiz Page Widget ---
class QuizPage extends StatefulWidget {
  final String quizTitle;
  final Quiz quizData; // Pass the structured quiz data

  const QuizPage({
    super.key,
    required this.quizTitle,
    required this.quizData,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int?
      _selectedOptionIndex; // Stores the selected option for the current question

  // This list will store the user's answers for each question
  // For simplicity, we'll store the index of the selected option
  final List<int?> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    // Initialize user answers list to null for all questions
    _userAnswers.addAll(List.filled(widget.quizData.questions.length, null));
  }

  void _onOptionSelected(int? index) {
    setState(() {
      _selectedOptionIndex = index;
      if (_currentQuestionIndex < _userAnswers.length) {
        _userAnswers[_currentQuestionIndex] = index;
      }
    });
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < widget.quizData.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        // Load previously selected answer for the new question
        _selectedOptionIndex = _userAnswers[_currentQuestionIndex];
      });
    } else {
      _handleSubmitQuiz();
    }
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        // Load previously selected answer for the new question
        _selectedOptionIndex = _userAnswers[_currentQuestionIndex];
      });
    }
  }

  void _handleSubmitQuiz() {
    int correctCount = 0;
    for (int i = 0; i < widget.quizData.questions.length; i++) {
      if (_userAnswers[i] != null &&
          _userAnswers[i] == widget.quizData.questions[i].correctAnswerIndex) {
        correctCount++;
      }
    }

    // Determine the message based on score
    String message;
    String animationAsset; // Placeholder for future animation logic
    if (correctCount >= widget.quizData.questions.length * 0.8) {
      // 80% or more for high grade
      message = "Fantastic Job! You're a Quiz Whiz! 🎉";
      // animationAsset = 'assets/animations/confetti.json'; // Example
    } else if (correctCount >= widget.quizData.questions.length * 0.5) {
      // 50-79% for good effort
      message = "Great Effort! You're learning so much! Keep it up! 💪";
      // animationAsset = 'assets/animations/thumbs_up.json'; // Example
    } else {
      message =
          "You're doing great! Every question is a chance to learn. Keep trying! ✨";
      // animationAsset = 'assets/animations/sparkle.json'; // Example
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Center(
            child: Text(
              "Quiz Results!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "You got $correctCount out of ${widget.quizData.questions.length} correct!"),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              // Lottie.asset(animationAsset, width: 100, height: 100), // Uncomment if using Lottie
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context)
                    .pop(); // Go back from quiz page to story list
              },
              child: const Text("Done",
                  style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion =
        widget.quizData.questions[_currentQuestionIndex];
    final bool isLastQuestion =
        _currentQuestionIndex == widget.quizData.questions.length - 1;

    return Scaffold(
      extendBodyBehindAppBar: true, // Allow background to go under AppBar
      appBar: AppBar(
        title: Text(
          widget.quizTitle,
          style: const TextStyle(
              color: Colors.black87,
              fontFamily: 'serif'), // Custom font/style as in image
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'lib/asset/images/stories/yunus/quiz_background.png', // Placeholder path for the background image
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color:
                    Colors.blueGrey.shade100, // Fallback color if image fails
                alignment: Alignment.center,
                child: const Text('Background Image Not Found',
                    style: TextStyle(color: Colors.black54)),
              );
            },
          ),
          // Gradient Overlay to make text readable
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.8), // Top light overlay
                  Colors.white.withOpacity(0.2), // Fades to bottom
                ],
                stops: const [0.0, 0.4], // Adjust stop points for fade
              ),
            ),
          ),
          // Content
          Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      kToolbarHeight +
                      20), // Space for AppBar and padding

              // Quiz Time Title
              Text(
                'Quiz Time!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 30),

              // Quiz Card Container
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color:
                        Colors.white.withOpacity(0.8), // Semi-transparent card
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Text
                      Text(
                        currentQuestion.questionText,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(height: 20),

                      // Options Grid
                      Expanded(
                        child: GridView.builder(
                          physics:
                              const NeverScrollableScrollPhysics(), // Disable scrolling of grid
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns
                            childAspectRatio:
                                2.5, // Aspect ratio for option buttons
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: currentQuestion.options.length,
                          itemBuilder: (context, index) {
                            final bool isSelected =
                                _selectedOptionIndex == index;
                            return ElevatedButton(
                              onPressed: () => _onOptionSelected(index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected
                                    ? Colors.lightGreen.shade200
                                    : Colors.white,
                                foregroundColor: Colors.black87,
                                side: BorderSide(
                                  color: isSelected
                                      ? Colors.green.shade600
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: isSelected ? 4 : 2,
                              ),
                              child: Text(
                                currentQuestion.options[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: Colors.black87,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Space for next questions based on image
                      // This part assumes only the first question card shows "blank" cards for subsequent questions
                      if (!isLastQuestion && _currentQuestionIndex == 0)
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            // Mock future questions (as seen in the design image)
                            _buildBlankQuestionCard(2), // Mock for Q2
                            const SizedBox(height: 15),
                            _buildBlankQuestionCard(3), // Mock for Q3
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Navigation Buttons (Previous and Next/Submit)
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30.0, left: 24.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Previous Button
                    if (_currentQuestionIndex > 0)
                      ElevatedButton(
                        onPressed: _goToPreviousQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    else
                      const SizedBox(
                          width: 130), // Placeholder to maintain spacing

                    // Next/Submit Button
                    ElevatedButton(
                      onPressed: _selectedOptionIndex == null && !isLastQuestion
                          ? null // Disable if no option selected and not last question
                          : _goToNextQuestion, // Go to next question or submit
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLastQuestion
                            ? Colors.green
                            : Colors.blueAccent, // Green for Submit
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                      ),
                      child: Text(
                        isLastQuestion ? 'Submit Quiz' : 'Next',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper to build blank question cards as seen in the design
  Widget _buildBlankQuestionCard(int questionNumber) {
    return Container(
      width: double.infinity,
      height: 100, // Approximate height for a blank question card
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6), // Lighter semi-transparent
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$questionNumber. What kind of animal swallowed Yunus?', // Mock question
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
