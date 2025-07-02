// ✅ Cleaned version of tab_kids.dart
import 'package:flutter/material.dart';
import 'package:salah_tracker_fe/content.dart';
import 'story_reader.dart';

class TabKids extends StatelessWidget {
  const TabKids(param0, String s, Strings, Null Function(dynamic val) param3,
      Null Function(dynamic val) param4, String,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kids Stories"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: storyData.length,
          itemBuilder: (context, index) {
            final story = storyData[index];
            return StoryCard(story: story);
          },
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Map<String, dynamic> story;

  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    story['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                story['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(story['subtitle']),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryReader(
                          title: story['title'],
                          pages: List<String>.from(story['pages']),
                          backgroundImages:
                              List<String>.from(story['pageImages']),
                          audioFiles: List<String>.from(story['audioFiles']),
                        ),
                      ),
                    );
                  },
                  child: const Text("Read Story"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
