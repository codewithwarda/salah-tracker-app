// import 'package:flutter/material.dart';
// import 'package:salah_tracker_fe/kids/quiz_screen.dart'; // Make sure this path is correct

// class StoryReader extends StatefulWidget {
//   final String title;
//   final List<String> pages;
//   final List<String> backgroundImages;
//   final List<String> audioFiles;

//   const StoryReader({
//     super.key,
//     required this.title,
//     required this.pages,
//     required this.backgroundImages,
//     required this.audioFiles,
//   });

//   @override
//   State<StoryReader> createState() => _StoryReaderState();
// }

// class _StoryReaderState extends State<StoryReader> {
//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void nextPage() {
//     if (currentPage < widget.pages.length - 1) {
//       setState(() => currentPage++);
//     }
//   }

//   void previousPage() {
//     if (currentPage > 0) {
//       setState(() => currentPage--);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLastPage = currentPage == widget.pages.length - 1;

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         centerTitle: true,
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//             fontFamily: 'Snell Roundhand',
//             fontSize: 24,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             widget.backgroundImages[currentPage],
//             fit: BoxFit.cover,
//           ),
//           Column(
//             children: [
//               const Spacer(),
//               Container(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text(
//                   widget.pages[currentPage],
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     height: 1.5,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     if (currentPage > 0)
//                       ElevatedButton(
//                         onPressed: previousPage,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: Colors.deepPurple,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Text("Previous"),
//                       )
//                     else
//                       const SizedBox(width: 100),
//                     Text(
//                       'Page ${currentPage + 1} of ${widget.pages.length}',
//                       style: const TextStyle(
//                           color: Color.fromARGB(255, 255, 254, 254)),
//                     ),
//                     ElevatedButton(
//                       onPressed: isLastPage ? null : nextPage,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Colors.deepPurple,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: Text(isLastPage ? "Finish" : "Next"),
//                     ),
//                   ],
//                 ),
//               ),
//               if (isLastPage) ...[
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const QuizScreen()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 177, 122, 52),
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 24, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: const Text(
//                     "Take the Quiz!",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//               const SizedBox(height: 20),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// ✅ Fully styled story_reader.dart with full-screen content and bottom buttons
import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // Import your quiz screen here

class StoryReader extends StatefulWidget {
  final String title;
  final List<String> pages;
  final List<String> backgroundImages;
  final List<String> audioFiles;

  const StoryReader({
    super.key,
    required this.title,
    required this.pages,
    required this.backgroundImages,
    required this.audioFiles,
  });

  @override
  State<StoryReader> createState() => _StoryReaderState();
}

class _StoryReaderState extends State<StoryReader> {
  int currentPage = 0;

  void nextPage() {
    if (currentPage < widget.pages.length - 1) {
      setState(() => currentPage++);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() => currentPage--);
    }
  }

  void goToQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == widget.pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Snell Roundhand',
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.backgroundImages[currentPage],
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.pages[currentPage],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage > 0)
                      ElevatedButton(
                        onPressed: previousPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text("Previous"),
                      )
                    else
                      const SizedBox(width: 100),
                    Text(
                      'Page ${currentPage + 1} of ${widget.pages.length}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: isLastPage ? goToQuiz : nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(isLastPage ? "Quiz" : "Next"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
