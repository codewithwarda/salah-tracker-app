// // // ✅ result_screen.dart with matching quiz design
// // import 'package:flutter/material.dart';

// // class ResultScreen extends StatelessWidget {
// //   final int score;
// //   final int total;

// //   const ResultScreen({super.key, required this.score, required this.total});

// //   @override
// //   Widget build(BuildContext context) {
// //     int stars = (score == total)
// //         ? 3
// //         : (score >= total * 0.5)
// //             ? 2
// //             : 1;

// //     String message = (stars == 3)
// //         ? 'Great Job!'
// //         : (stars == 2)
// //             ? 'Well done, keep going!'
// //             : 'Don’t give up! Try again!';

// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         title: const Text('Yunus (AS)',
// //             style: TextStyle(
// //               fontFamily: 'Snell Roundhand',
// //               fontSize: 24,
// //               color: Colors.black,
// //             )),
// //         centerTitle: true,
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         leading: const BackButton(color: Colors.black),
// //       ),
// //       body: Stack(
// //         fit: StackFit.expand,
// //         children: [
// //           Image.asset(
// //             'lib/assets/images/stories/yunus/quiz_background.png',
// //             fit: BoxFit.cover,
// //           ),
// //           Center(
// //             child: Container(
// //               margin: const EdgeInsets.all(16),
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.brown.withOpacity(0.4),
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   const Text('Result Time!',
// //                       style: TextStyle(
// //                           fontSize: 26,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black)),
// //                   const SizedBox(height: 20),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: List.generate(3, (index) {
// //                       return Icon(
// //                         Icons.star,
// //                         size: 40,
// //                         color: index < stars ? Colors.amber : Colors.grey,
// //                       );
// //                     }),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Text(
// //                     message,
// //                     style: const TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.w500,
// //                         color: Colors.black),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Text(
// //                     '$score/$total',
// //                     style: const TextStyle(
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.black),
// //                   ),
// //                   const SizedBox(height: 30),
// //                   ElevatedButton(
// //                     onPressed: () => Navigator.pop(context),
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.white,
// //                       foregroundColor: Colors.black,
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 24, vertical: 12),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20),
// //                       ),
// //                     ),
// //                     child: const Text('Try Again'),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // ✅ Fully styled result_screen.dart with matching quiz design and buttons
// import 'package:flutter/material.dart';
// import 'package:salah_tracker_fe/kids/story_reader.dart';

// class ResultScreen extends StatelessWidget {
//   final int score;
//   final int total;
//   final String backgroundImage;

//   const ResultScreen({
//     super.key,
//     required this.score,
//     required this.total,
//     required this.backgroundImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     int stars = (score == total)
//         ? 3
//         : (score >= total * 0.5)
//             ? 2
//             : 1;

//     String message = (stars == 3)
//         ? 'Great Job!'
//         : (stars == 2)
//             ? 'Well done, keep going!'
//             : 'Don’t give up! Try again!';

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: const Text(
//           'Yunus (AS)',
//           style: TextStyle(
//             fontFamily: 'Snell Roundhand',
//             fontSize: 24,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             backgroundImage,
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: Container(
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.brown.withOpacity(0.4),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Result Time!',
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(3, (index) {
//                       return Icon(
//                         Icons.star,
//                         size: 40,
//                         color: index < stars ? Colors.amber : Colors.grey,
//                       );
//                     }),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     message,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     '$score/$total',
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.black,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Text('Try Again'),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => StoryReader(
//                             title: 'Yunus (AS)',
//                             pages: ['Page 1', 'Page 2'],
//                             backgroundImages: [
//                               'lib/assets/images/stories/yunus/yunus.png',
//                               'lib/assets/images/stories/yunus/yunus_town.png',
//                             ],
//                             audioFiles: [],
//                           ),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.black,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Text('Read Story Again'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:salah_tracker_fe/kids/story_reader.dart';
import 'package:salah_tracker_fe/kids/tab_kids.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String backgroundImage;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    int stars = (score == total)
        ? 3
        : (score >= total * 0.5)
            ? 2
            : 1;

    String message = (stars == 3)
        ? 'Great Job!'
        : (stars == 2)
            ? 'Well done, keep going!'
            : 'Don’t give up! Try again!';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Yunus (AS)',
          style: TextStyle(
            fontFamily: 'Snell Roundhand',
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImage,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Result Time!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Icon(
                        Icons.star,
                        size: 40,
                        color: index < stars ? Colors.amber : Colors.grey,
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$score/$total',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Try Again'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const TabKids()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Read Story Again'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
